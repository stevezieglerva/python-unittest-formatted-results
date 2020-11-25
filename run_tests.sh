source venv/bin/activate
pip install -r requirements.txt
rm reports/*.*

echo "Running: $1"


rm test_fakes3*.*


if [[ $1 == "simple" ]] 
then
    export test_file_pattern="test_*.*"
    if [[ -n "$2" ]] 
    then
        echo "found pattern"
        export test_file_pattern="$2"
    fi
    python3 -m unittest discover -s tests -p "$test_file_pattern"
else
    export test_file_pattern="test_*.*"
    if [[ $# -ne 0 ]] 
    then
        echo "found pattern"
        export test_file_pattern="$1"
    fi
    coverage run  --omit=*/venv/*.*,*/tests/*.py,test_and_format.py test_and_format.py tests/ "$test_file_pattern"
    coverage report 
    coverage report | tail -1 | sed "s/^.*  //g" | grep -e "[7-9][0-9]%"
    if [ $? -ne 0 ]
    then
        echo "⛔ Found coverage is too low"
    else
        echo "🏆 Coverage is good"
    fi
fi



