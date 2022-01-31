#!/usr/bin/python3
import psycopg2, cgi
import login 

form = cgi.FieldStorage()

cni = form.getvalue('cni')
iso_code_boat = form.getvalue('iso_code_boat')
iso_code_sailor = form.getvalue('iso_code_sailor')
id_sailor = form.getvalue('id_sailor')
start_date = form.getvalue('start_date')
end_date = form.getvalue('end_date')

print(form)


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

	sql = 'INSERT INTO schedule VALUES(%s, %s);'
	data = (start_date,end_date)
	print('<p>{}</p>'.format(sql % data))
	cursor.execute(sql, data)

	sql = 'INSERT INTO reservation VALUES( %s, %s, %s, %s , %s, %s);'
	data = (cni, iso_code_boat , id_sailor, iso_code_sailor,start_date,end_date)
	print('<p>{}</p>'.format(sql % data))
	cursor.execute(sql, data)

	connection.commit()

	# Closing connection
	cursor.close()

	print('<td><a href = "reservation.cgi">Go Back</a></td>')

		
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error ocurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
print('</body>')
print('</html>')
