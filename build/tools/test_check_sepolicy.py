#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

"""Regression tests for policy review checks."""

import unittest
from pathlib import Path

from check_sepolicy import check_text


class CheckPolicyTest(unittest.TestCase):
    def check(self, name, text):
        return [message for _, message in check_text(Path(name), text)]

    def test_lineage_macros_but_not_comments(self):
        errors = self.check('vendor/example.te', '''# rw_dir_file(a, b)
rw_dir_file(a, b)
create_dir_file(a, b)
hal_attribute_lineage(a)
''')
        self.assertEqual(sum('Lineage-only' in error for error in errors), 3)

    def test_sections_in_any_policy_file(self):
        for name in ('example.te', 'service_contexts', 'property_contexts', 'custom_contexts'):
            with self.subTest(name=name):
                errors = self.check(name, '# DMI\n\n# DHCP\n')
                self.assertTrue(any('out of order' in error for error in errors))

    def test_subsections_and_invalid_titles(self):
        errors = self.check('example.te', '''# Alpha
## Zebra
### Gamma
### Beta
## Apple
# Beta
## Zebra
''')
        self.assertEqual(sum('out of order' in error for error in errors), 2)
        self.assertTrue(self.check('example.te', '#title\n'))
        self.assertTrue(self.check('example.te', '#Bad title\n'))
        self.assertTrue(self.check('example.te', '# title\n'))
        self.assertIn('subsection has no parent section', self.check('example.te', '### Orphan\n### Another\n'))
        self.assertFalse(self.check('example.te', '# Alpha\n## Beta\n### Gamma\n# Delta\n'))
        self.assertTrue(self.check('example.te', '# Zeta Section With A Long Title\n# Alpha Section With A Long Title\n'))
        self.assertFalse(self.check('example.te', '# needed for libmodprobe to read kernel commandline\n'))

    def test_rule_blocks_and_macros(self):
        self.assertTrue(self.check('custom.te', 'allow z b:file read;\nallow a b:file read;\n'))
        self.assertTrue(self.check('custom.te', 'vendor_public_prop(z)\nvendor_public_prop(a)\n'))
        self.assertTrue(self.check('custom.te', 'get_prop(a, b)\nallow a b:file read;\n'))
        self.assertFalse(self.check('custom.te', 'allow z b:file read;\n\nallow a b:file read;\n'))
        self.assertFalse(self.check('custom.te', 'allow a b:file read;\nget_prop(a, b)\n'))
        self.assertFalse(self.check('custom.te', "recovery_only(`\n    get_prop(a, b)\n')\n"))
        self.assertFalse(self.check('custom.te', "recovery_only(`\n    domain_trans(a, b, c)\n')\n"))

    def test_context_order_and_directory_first(self):
        label = '\tu:object_r:a:s0\n'
        self.assertTrue(self.check('file_contexts', '/vendor/bin/z' + label + '/vendor/bin/aaa/b' + label))
        self.assertTrue(self.check('file_contexts', '/dev/dri/card0' + label + '/dev/dri' + label))
        self.assertFalse(self.check('file_contexts', '/vendor/bin/aaa/b' + label + '/vendor/bin/z' + label))
        self.assertFalse(self.check('file_contexts', '/dev/dri' + label + '/dev/dri/card0' + label))
        self.assertTrue(self.check('genfs_contexts', 'genfscon sysfs /z' + label + 'genfscon sysfs /a' + label))

    def test_context_tabs_and_leading_indent(self):
        self.assertTrue(self.check('file_contexts', '/dev/foo u:object_r:a:s0\n'))
        self.assertTrue(self.check('genfs_contexts', 'genfscon sysfs /foo u:object_r:a:s0\n'))
        self.assertFalse(self.check('genfs_contexts', 'genfscon sysfs /foo\tu:object_r:a:s0\n'))
        self.assertTrue(self.check('example.te', '  allow a b:file read;\n'))
        self.assertTrue(self.check('example.te', '\tallow a b:file read;\n'))
        self.assertFalse(self.check('example.te', '    allow a b:file read;\n'))
        self.assertFalse(self.check('example.te', '        allow a b:file read;\n'))


if __name__ == '__main__':
    unittest.main()
