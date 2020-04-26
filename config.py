from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'Arun@123'
app.config['MYSQL_DATABASE_DB'] = 'tansy_cloud'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
