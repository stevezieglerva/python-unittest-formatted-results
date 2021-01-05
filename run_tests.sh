source venv/bin/activate
pip install -r requirements.txt
rm reports/*.*

echo "Running: $1"

# . run_tests.sh simple
# . run_tests.sh "*unit*.*"
# . run_tests.sh fail 
# . run_tests.sh fail "*unit*.*" 

if [[ $1 == "simple" ]] 
then
    # run the simplified, normal version of unittest to see out script output
    export test_file_pattern="test_*.*"
    if [[ -n "$2" ]] 
    then
        echo "found pattern"
        export test_file_pattern="$2"
    fi
    python3 -m unittest discover -s tests -p "$test_file_pattern"
else
    # run the formatted version of the tests and calculate coverage
    export test_file_pattern="test_*.*"
    if [[ $# -ne 0 ]] 
    then
        echo "found pattern"
        export test_file_pattern="$1"
    fi
    coverage run  --omit=*/venv/*.*,*/tests/*.py,test_and_format.py test_and_format.py tests/ "$test_file_pattern"
    coverage report 
    # look for coverage > 70%
    coverage report | tail -1 | sed "s/^.*  //g" | grep -E -w "[7-9][0-9]%|100%"
    if [ $? -ne 0 ]
    then
        echo "⛔ Found coverage is too low"
    else
        echo "🏆 Coverage is good"
    fi

    # If fail argument provided, exit with an error code
    if [[ $1 == "fail" ]] 
    then
        exit 1
    fi
fi



