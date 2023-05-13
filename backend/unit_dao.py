def get_units(connection):
    cursor = connection.cursor()
    query = ("SELECT * FROM unit")
    cursor.execute(query)

    response = []
    for(unit_id, unit_name) in cursor:
        response.append({
            'unit_id': unit_id,
            'unit_name': unit_name
        })
    return response



if __name__ == '__main__':
    from sql_connection import get_sql_connection
    connection  = get_sql_connection()
    print(get_units(connection))