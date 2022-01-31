#!/usr/bin/python3
import psycopg2, cgi 
import login

form = cgi.FieldStorage()

cni = form.getvalue('cni')
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

	sql = 'DELETE FROM trip t WHERE t.cni = %s AND t.iso_code_boat = %s;'
	data = (cni,iso_code)
	print('<p>{}</p>'.format(sql % data))
	cursor.execute(sql, data)

	sql = 'DELETE FROM reservation r WHERE r.cni= %s AND r.iso_code_boat= %s;'
	data = (cni,iso_code)
	print('<p>{}</p>'.format(sql % data))
	cursor.execute(sql, data)

	sql = 'DELETE FROM schedule WHERE (start_date, end_date) NOT IN (SELECT start_date, end_date FROM reservation);'
	print('<p>{}</p>'.format(sql))
	cursor.execute(sql)

	sql = 'DELETE FROM boat_vhf bv WHERE bv.cni= %s AND bv.iso_code=%s;'
	data = (cni,iso_code)
	print('<p>{}</p>'.format(sql % data))
	cursor.execute(sql, data)

	sql = '	DELETE FROM boat b WHERE b.cni=%s AND b.iso_code=%s;'
	data = (cni,iso_code)
	print('<p>{}</p>'.format(sql % data))
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