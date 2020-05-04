### ================================================ START UBUNTU =============================================================
## STEP 1: start flask app
type below commands in ubuntu command prompt

# get api code to your computer, clone git repo
git clone https://github.com/safderalimd01/P1.PY.FLSK.L01.P01.git

# change working directory in command line tool
cd P1.PY.FLSK.L01.P01

# Create environment with python 3.7
sudo apt install python3.7 python3-venv python3.7-venv
python3.7 -m venv env_project1

# Activate the environment
source env_project1/bin/activate

# Install the dependencies
pip install -r requirements.txt

# Run Flask App in development mode
flask run


### ================================================ END UBUNTU =============================================================
