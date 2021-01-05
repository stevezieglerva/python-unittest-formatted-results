# python-unittest-formatted-results
✅ Wrapper for [HtmlTestRunner](https://github.com/oldani/HtmlTestRunner) to produce a JSON test results file and output nicely formatted CLI results. Includes a starting bash script [run_tests.sh](run_tests.sh) to execute tests and calculate coverage. The script reports on coverage less than 70%.

The script uses emjois liberally to provide quick visual comprehension of test results and coverage directly on the command line (without having to open other files).


## Pre-reqs
```
pip install -r requirements.txt
```

## Usage
Run the bash script run_tests.sh
```
> . run_tests.sh 
```

### Arguments
* simple|fail - If the first argument is "simple", the typical unittest output will be displayed. This can be useful to see specific test output. If the first argument is "fail", the script will return an error code if any tests failed. This is useful to trigger a failing build when tests fail.
* test file pattern - test filename pattern, enclosed in quotes, under the tests/ folder to limit the test files executed. **Note:** The pattern must end in ".*" in order for both the .py test execution and .html CLI output filtering.




By default, all test files in the tests/ directory will be run:
```bash
> . run_tests.sh  

🗃  Test Results:


📋 test_example.TestStringMethods:
   Status  | Test
   ---------------------------------------------------
   ❌ error | test_error                                                                      
   ❗ fail  | test_fail                                                                       
   ✅ pass  | test_isupper                                                                    
   ➖ skip  | test_skip                                                                       
   ✅ pass  | test_split                                                                      
   ✅ pass  | test_upper                                                                      


📋 test_example.TestIntMethods:
   Status  | Test
   ---------------------------------------------------
   ❗ fail  | test_fail_add                                                                   
   ✅ pass  | test_pass_subtract                                                              


📋 test_example_2.TestDBMethods:
   Status  | Test
   ---------------------------------------------------
   ❗ fail  | test_fail_db                                                                    
   ✅ pass  | test_func_2_0                                                                   
   ✅ pass  | test_func_2_1                                                                   
   ✅ pass  | test_pass_db                                                                    

🗂  Total Tests: 12

😡 Some tests failed!
Name               Stmts   Miss  Cover
--------------------------------------
source_code_1.py       8      3    62%
source_code_2.py       8      0   100%
--------------------------------------
TOTAL                 16      3    81%
81%
🏆 Coverage is good
```


To run tests with just "_2" in the filename to run just the DB tests:
```bash
> . run_tests.sh "*_2.*"

🗃  Test Results:


📋 test_example_2.TestDBMethods:
   Status  | Test
   ---------------------------------------------------
   ❗ fail  | test_fail_db                                                                    
   ✅ pass  | test_func_2_0                                                                   
   ✅ pass  | test_func_2_1                                                                   
   ✅ pass  | test_pass_db                                                                    

🗂  Total Tests: 4

😡 Some tests failed!
Name               Stmts   Miss  Cover
--------------------------------------
source_code_2.py       8      0   100%
100%
🏆 Coverage is good
```

To run the "_2" tests in simple mode:
```bash
> . run_tests.sh simple "*_2.*"

Running: simple
rm: test_fakes3*.*: No such file or directory
found pattern
F...
======================================================================
FAIL: test_fail_db (test_example_2.TestDBMethods)
This test should fail.
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/sziegler/Documents/GitHub/python-unittest-formatted-results/tests/test_example_2.py", line 9, in test_fail_db
    self.assertEqual(1, 2)
AssertionError: 1 != 2

----------------------------------------------------------------------
Ran 4 tests in 0.001s

FAILED (failures=1)
```


