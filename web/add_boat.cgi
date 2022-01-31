#!/usr/bin/python3
import psycopg2, cgi
import login 

form = cgi.FieldStorage()
cni = form.getvalue('cni')
iso_code = form.getvalue('iso_code')
name = form.getvalue('name')
year = form.getvalue('year')
id_owner = form.getvalue('id_owner')
iso_code_owner = form.getvalue('iso_code_owner')
mmsi = form.getvalue('mmsi')

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

	# Making query
	sql = 'INSERT INTO boat VALUES( %s, %s, %s, %s , %s, %s);'
	data = (name, year, cni, iso_code , id_owner, iso_code_owner)
	# The string has the {}, the variables inside format() will replace the {}
	print('<p>{}</p>'.format(sql % data))
	# Feed the data to the SQL query as follows to avoid SQL injection
	cursor.execute(sql, data)

	if mmsi!=None:
		# Making query
		sql = 'INSERT INTO boat_vhf VALUES( %s, %s, %s);'
		data = (mmsi, cni, iso_code )
		# The string has the {}, the variables inside format() will replace the {}
		print('<p>{}</p>'.format(sql % data))
		# Feed the data to the SQL query as follows to avoid SQL injection
		cursor.execute(sql, data)

	connection.commit()

	# Closing connection
	cursor.close()

	print('<td><a href = "boat.cgi">Go Back</a></td>')

except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error ocurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
print('</body>')
print('</html>')
