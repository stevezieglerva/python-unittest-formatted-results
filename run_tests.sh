source venv/bin/activate
pip install -r requirements.txt
rm reports/*.*

echo "Running: $1"

if [[ $1 == "simple" ]] 
then
    python3 -m unittest discover -s tests 
else
    coverage run  --omit=*/venv/*.*,*/tests/*.py,test_and_format.py test_and_format.py
    coverage report 
    coverage report | grep TOTAL | sed "s/^.*  //g" | grep -e "[7-9][0-9]%"
    if [ $? -ne 0 ]
    then
        echo "⛔ Found coverage is too low"
    else
        echo "🏆 Coverage is good"
    fi
fi



