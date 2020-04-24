import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request

@app.route('/addProduct', methods=['POST'])
def add_product():
	try:
		_json = request.json
		_product_name = _json['product_name']
		_active = _json['active']
		conn = mysql.connect()
		if _product_name and _active and request.method == 'POST':
			sqlQuery = "INSERT INTO product(product_name, active) VALUES(%s, %s)"
			bindData = (_product_name, _active)

			cursor = conn.cursor()
			cursor.execute(sqlQuery, bindData)
			conn.commit()
			close_connection(conn, cursor)
			respone = jsonify('Product added successfully!')
			respone.status_code = 200
			return respone
		else:
			return not_found()
	except Exception as e:
		return {"error": str(e)}, 400


@app.route('/productList')
def product_listing():
	try:
		conn = mysql.connect()
		cursor = conn.cursor(pymysql.cursors.DictCursor)
		cursor.execute("SELECT product_id, product_name, active FROM product")
		productRows = cursor.fetchall()
		close_connection(conn, cursor)
		respone = jsonify(productRows)
		respone.status_code = 200
		return respone
	except Exception as e:
		return {"error": str(e)}

@app.route('/productDetail/<int:id>')
def product_detail(id):
	try:
		conn = mysql.connect()
		cursor = conn.cursor(pymysql.cursors.DictCursor)
		cursor.execute("SELECT product_id, product_name, active FROM product WHERE product_id =%s", id)
		productRow = cursor.fetchone()
		close_connection(conn, cursor)
		respone = jsonify(productRow)
		respone.status_code = 200
		return respone
	except Exception as e:
		return {"error": str(e)}

@app.route('/updateProduct', methods=['PUT'])
def update_product():
	try:
		_json = request.json
		if _json['product_name'] and _json['product_id'] and request.method == 'PUT':
			sqlQuery = "UPDATE product set product_name=%s, active=%s where product_id = %s"
			_product_name = _json['product_name']
			_active = _json['active']
			_product_id = _json['product_id']
			bindData = (_product_name, _active, _product_id)
			conn = mysql.connect()
			cursor = conn.cursor()
			cursor.execute(sqlQuery, bindData)
			conn.commit()
			close_connection(conn, cursor)
			respone = jsonify('Product updated successfully!')
			respone.status_code = 200
			return respone
		else:
			return not_found()
	except Exception as e:
		return {"error": str(e)}

@app.route('/productDelete/<int:id>', methods=['DELETE'])
def delete_product(id):
	try:
		conn = mysql.connect()
		cursor = conn.cursor()
		cursor.execute("DELETE FROM product WHERE product_id =%s", (id,))
		conn.commit()
		close_connection(conn, cursor)
		respone = jsonify('Product deleted successfully!')
		respone.status_code = 200
		return respone
	except Exception as e:
		return {"error": str(e)}

@app.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'Record not found: ' + request.url,
    }
    respone = jsonify(message)
    respone.status_code = 404
    return respone

def close_connection(conn, cursor):
	cursor.close()
	conn.close()

if __name__ == "__main__":
    app.run()
