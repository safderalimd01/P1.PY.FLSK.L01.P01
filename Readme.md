# FOR UBUNTU (use ubuntu command prompt) 
## STEP 1: install python
#### NOTE: type below command in ubuntu command prompt
sudo apt install python3.7 python3-venv python3.7-venv

## STEP 2: start flask app

#### STEP 2.1: download api code from github
git clone https://githubcom/safderalimd01/P1

#### STEP 2.2: change working directory in command line tool
cd P1.PY.FLSK.L01.P01

#### STEP 2.3: Create environment with python 3.7
python3.7 -m venv env_project1

#### STEP 2.4: Activate the environment
source env_project1/bin/activate

#### STEP 2.5:Install the dependencies
pip install -r requirements.txt

#### STEP 2.6:Run Flask App in development mode
flask run



