#!/usr/bin/env python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

"""Check device SELinux policy style and AOSP compatibility."""

import argparse
import os
import re
from pathlib import Path


LINEAGE_MACRO = re.compile(r'\b(rw_dir_file|create_dir_file|hal_attribute_lineage)\s*\(')
HEADING = re.compile(r'^(#{1,3}) ([A-Za-z][A-Za-z0-9() _-]*)$')
UNSPACED_HEADING = re.compile(r'^#{1,3}[A-Za-z][A-Za-z0-9_ -]*$')
MACRO_CALL = re.compile(r'^[a-z_][a-z_0-9]*\(')


def file_contexts_out_of_order(previous, current):
    """Sort directory entries before sibling files, but parents before children."""
    earlier = previous.split('/')
    later = current.split('/')
    for index, (left, right) in enumerate(zip(earlier, later)):
        if left == right:
            continue
        left_dir = index < len(earlier) - 1
        right_dir = index < len(later) - 1
        if left_dir != right_dir:
            return right_dir
        return right < left
    return len(later) < len(earlier)


def check_text(path, text):
    """Return (line number, message) pairs for one policy file."""
    errors = []
    is_context = path.name.endswith('_contexts')
    sections = []
    previous_code = None
    previous_entry = None

    for number, raw_line in enumerate(text.splitlines(), 1):
        line = raw_line.strip()
        if not line:
            previous_code = previous_entry = None
            continue

        indent = raw_line[:len(raw_line) - len(raw_line.lstrip(' \t'))]
        if indent and ('\t' in indent or len(indent) % 4):
            errors.append((number, 'leading indentation must use multiples of four spaces'))

        if line.startswith('#'):
            # Prose comments can explain individual rules without participating
            # in section order; lowercase short titles are still invalid sections.
            heading = HEADING.fullmatch(line) if path.suffix == '.te' or is_context else None
            if heading and (
                len(heading.group(2).split()) <= 4
                or all(word[0].isupper() for word in heading.group(2).split())
            ):
                depth = len(heading.group(1))
                title = heading.group(2)
                if not title[0].isupper():
                    errors.append((number, f'section {title!r} must start with an uppercase letter'))
                if depth > len(sections) + 1:
                    errors.append((number, 'subsection has no parent section'))
                    depth = len(sections) + 1
                if depth <= len(sections) and title.casefold() < sections[depth - 1]:
                    errors.append((number, f'section {title!r} is out of order'))
                sections[depth - 1:] = [title.casefold()]
            elif (path.suffix == '.te' or is_context) and UNSPACED_HEADING.fullmatch(line):
                errors.append((number, 'section title must have a space after #'))
            previous_code = previous_entry = None
            continue

        code = raw_line.partition('#')[0].strip()
        if path.suffix == '.te' or path.name == 'te_macros':
            for match in LINEAGE_MACRO.finditer(code):
                errors.append((number, f'{match.group(1)} is a Lineage-only macro'))

        if path.suffix == '.te':
            if code in {"')", '};'} or code.endswith(('{', '(`')):
                previous_code = None
            else:
                key = (bool(MACRO_CALL.match(code)), code.casefold())
                if previous_code is not None and key < previous_code:
                    errors.append((number, 'policy rule is out of order'))
                previous_code = key

        if not is_context:
            continue

        fields = code.split()
        if not fields:
            continue
        if path.name == 'file_contexts':
            if not re.fullmatch(r'\S+(?:\t+\S+)+', code):
                errors.append((number, 'file context fields must be separated by tabs'))
            entry = fields[0].casefold()
        elif path.name == 'genfs_contexts':
            if not re.fullmatch(r'genfscon[ \t]+\S+[ \t]+\S+\t+\S+(?:\t+\S+)*', code):
                errors.append((number, 'genfs context path and label must be separated by tabs'))
            entry = tuple(field.casefold() for field in fields[1:3])
        else:
            entry = fields[0].casefold()

        if previous_entry is not None:
            misordered = (
                file_contexts_out_of_order(previous_entry, entry)
                if path.name == 'file_contexts'
                else entry < previous_entry
            )
            if misordered:
                errors.append((number, f'entry {entry!r} is out of order (after {previous_entry!r})'))
        previous_entry = entry

    return errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('paths', nargs='*', type=Path, help='policy files or directories')
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    paths = args.paths or [root / 'sepolicy']
    failed = False
    for path in paths:
        if not path.exists():
            parser.error(f'{path}: no such file or directory')
        files = sorted(path.rglob('*')) if path.is_dir() else [path]
        for file in files:
            if not file.is_file() or not (file.suffix == '.te' or file.name.endswith('_contexts') or file.name == 'te_macros'):
                continue
            try:
                errors = check_text(file, file.read_text(encoding='utf-8'))
            except OSError as error:
                parser.error(str(error))
            for number, message in errors:
                print(f'{os.path.relpath(file, root)}:{number}: {message}')
            failed |= bool(errors)
    return int(failed)


if __name__ == '__main__':
    raise SystemExit(main())
