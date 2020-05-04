# FOR UBUNTU (use ubuntu command prompt) 
Required tools: you must have mysql workbench, mysql local server and postman tools already installed on your computer
#### NOTE: type below command in ubuntu command prompt

### STEP 1: install python
```sudo apt install python3.7 python3-venv python3.7-venv```

### STEP 2: start flask app

###### STEP 2.1: download api code from github
```git clone https://github.com/safderalimd01/P1.PY.FLSK.L01.P01.git```

###### STEP 2.2: change working directory in command line tool
```cd P1.PY.FLSK.L01.P01```

###### STEP 2.3: Create environment with python 3.7
```python3.7 -m venv env_project1```

###### STEP 2.4: Activate the environment
```source env_project1/bin/activate```

###### STEP 2.5:Install the dependencies
```pip install -r requirements.txt```

###### STEP 2.6:update mysql login credentials
manually edit config.py file in repo folder(P1.PY.FLSK.L01.P01) and update your mysql login id, password and local host

###### STEP 2.7:Run Flask App in development mode
```flask run```

## STEP 3: mysql
###### STEP 3.1: start mysql workbench
###### STEP 3.2: open create_tables.sql in workbench, file from db folder that exists in the repo folder(P1.PY.FLSK.L01.P01) that you downloaded
###### STEP 3.3: execute create_tables.sql in workbench
###### STEP 3.4: to load initial data execute initial_data_load.sql from same db folder

## STEP 4: postman
###### STEP 4.1: open postman and import postman file(P1.PY.FLSK.L01.P01.postman_collection.json) from repo folder that you downloaded from github using gitclone command
###### STEP 4.2: execute avilable api calls from this postman project



