import HtmlTestRunner
import unittest


class TestDBMethods(unittest.TestCase):
    def test_fail_db(self):
        """ This test should fail. """
        self.assertEqual(1, 2)

    def test_pass_db(self):
        """ This test should pass. """
        self.assertTrue(True)