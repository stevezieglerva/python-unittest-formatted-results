# python-unittest-formatted-results
✅ Wrapper for [HtmlTestRunner](https://github.com/oldani/HtmlTestRunner) to produce a JSON test results file and output nicely formatted CLI results.


## Pre-reqs
```
pip install html-testRunner
```

## Usage
Run the test_and_format.py file with optional command line arguments for [unittest's](https://docs.python.org/3/library/unittest.html) discover start directory and file matching pattern.

**Note:** The pattern must end in ".*" in order for both the .py test execution and .html CLI output filtering.

```
python3 test_and_format.py [start_dir] [pattern]
```

By default, all test files in the tests/ directory will be run:
```bash
> python3 test_and_format.py  

🗃  Test Results:


📋 test_example.TestStringMethods:
   Status  | Test
   ---------------------------------------------------
   ❌ error | test_error                                                                      
   ❗ fail  | test_fail                                                                       
   ✅  pass | test_isupper                                                                    
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
   ✅ pass  | test_pass_db                                                                    

🗂  Total Tests: 10

😡 Some tests failed!
```


To run tests with just "DB" in the filename:
```
> python3 test_and_format.py "tests" "*DB*.*"

🗃  Test Results:


📋 test_example_2.TestDBMethods:
   Status  | Test
   ---------------------------------------------------
   ❗ fail  | test_fail_db                                                                    
   ✅ pass  | test_pass_db                                                                    

🗂  Total Tests: 2

😡 Some tests failed!
```

You can also run the test.sh script to activate virtual environment, install requirements, and execute the tests

```
> . test.sh
```


