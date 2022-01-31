#!/usr/bin/python3
import psycopg2, cgi 
import login

form = cgi.FieldStorage()

id_card = form.getvalue('id')
iso_code = form.getvalue('iso_code')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Boat Management System</title>')
print('<link rel="stylesheet" href="CSS/general.css">')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials) 
    cursor = connection.cursor()

    # Making Query
    sql = 'DELETE FROM trip WHERE (cni, iso_code_boat) IN (SELECT b.cni, b.iso_code FROM boat b WHERE iso_code_owner = %s AND id_owner = %s);'
    data = (iso_code, id_card)
    print('<p>{}</p>'.format(sql % data))
    cursor.execute(sql, data)

    sql = 'DELETE FROM reservation WHERE (cni, iso_code_boat) IN (SELECT b.cni, b.iso_code FROM boat b WHERE iso_code_owner = %s AND id_owner = %s);'
    data = (iso_code, id_card)
    print('<p>{}</p>'.format(sql % data))
    cursor.execute(sql, data)

    sql = 'DELETE FROM schedule WHERE (start_date, end_date) NOT IN (SELECT start_date, end_date FROM reservation);'
    print('<p>{}</p>'.format(sql))
    cursor.execute(sql)

    sql = 'DELETE FROM boat_vhf WHERE (cni, iso_code) IN (SELECT b.cni, b.iso_code FROM boat b WHERE iso_code_owner = %s AND id_owner = %s);'
    data = (iso_code, id_card)
    print('<p>{}</p>'.format(sql % data))
    cursor.execute(sql, data)

    sql = 'DELETE FROM boat WHERE iso_code_owner = %s AND id_owner = %s;'
    data = (iso_code, id_card)
    print('<p>{}</p>'.format(sql % data))
    cursor.execute(sql, data)

    sql = 'DELETE FROM owner WHERE iso_code = %s AND id = %s;'
    data = (iso_code, id_card)
    print('<p>{}</p>'.format(sql % data))
    cursor.execute(sql, data)

    connection.commit()
    # Closing connection
    cursor.close()
    
    print('<td><a href = "owner.cgi">Go Back</a></td>')

except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error ocurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
print('</body>')
print('</html>')
