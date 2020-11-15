import HtmlTestRunner
import unittest
from source_code_2 import *


class TestDBMethods(unittest.TestCase):
    def test_fail_db(self):
        """ This test should fail. """
        self.assertEqual(1, 2)

    def test_pass_db(self):
        """ This test should pass. """
        self.assertTrue(True)

    def test_func_2_1(self):
        func_2(1)

    def test_func_2_0(self):
        func_2(0)
