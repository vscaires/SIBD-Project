#!/usr/bin/python3 
import psycopg2, cgi 
import login

form = cgi.FieldStorage()

id_card = form.getvalue('id')
iso_code = form.getvalue('iso_code')
birthdate = form.getvalue('birthdate')


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
    sql = 'INSERT INTO owner VALUES (%s, %s, %s);'
    data = (id_card, iso_code, birthdate)
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
