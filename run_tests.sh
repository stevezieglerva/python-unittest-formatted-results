
pip install -r requirements.txt
rm reports/*.*

echo "Running: $1"

if [[ $1 == "simple" ]] 
then
    python3 -m unittest discover -s tests 
else
    python3 test_and_format.py
fi



