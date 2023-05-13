#dao - Data access Object
# pip install mysql-connector-python
from sql_connection import get_sql_connection

def get_all_products(connection):

    cursor = connection.cursor()
    query= ("SELECT products.prod_id, products.prod_name, products.unit_id, unit.unit_name, products.ppu FROM products INNER JOIN unit ON products.unit_id=unit.unit_id;")
    cursor.execute(query)

    response =[]
    for (prod_id, prod_name, unit_id, ppu, unit_name) in cursor:
        response.append(
            {'prod_id': prod_id, 
             'prod_name': prod_name, 
             'unit_id': unit_id,
             'price_per_unit':ppu,
             'unit_name':unit_name}
        )
    return response

def insert_new_product(connection, product):

    cursor= connection.cursor()
    query = ("INSERT INTO products (prod_name, unit_id, ppu) VALUES (%s, %s, %s)")
    data = (product['prod_name'], product['unit_id'],product['ppu'])
    cursor.execute(query, data)
    connection.commit()

    return cursor.lastrowid

def delete_product(connection, product_id):
    cursor = connection.cursor()
    query = ("DELETE from products where prod_id = "+str(product_id))
    cursor.execute(query)
    connection.commit()

if __name__ == '__main__':
    connection = get_sql_connection()
    #print(get_all_products(connection))
    ''' print(insert_new_product(connection, {
        'prod_name': 'Potatoes',
        'unit_id': '2',
        'ppu' : '12'
    })) '''
    #print(delete_product(connection, 13)) 