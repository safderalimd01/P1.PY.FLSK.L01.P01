## Create environment with python 3.7
### sudo apt install python3.7 python3-venv python3.7-venv
### python3.7 -m venv flask_env

## Activate the environment
### source flask_env/bin/activate

## Install the dependencies
### pip install -r requirements.txt


## Run Flask App in development mode
### export FLASK_ENV=development
### python main.py

## Setting up MySQL server
### sudo apt-get update && sudo apt-get install mysql-server

## To test that the service is active
### systemctl is-active mysql
### systemctl is-enabled mysql
### sudo mysql_secure_installation

## Try to login from the mysql console
### mysql -u root -p
