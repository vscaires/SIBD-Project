#!/usr/bin/python3
import psycopg2
import login 

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Boat Management System</title>')
print('<link rel="stylesheet" href="CSS/general.css">')
print('<link rel="stylesheet" href="CSS/style_reservation.css">')
print('</head>')
print('<body>')
connection = None
try:
    # Creating connection
	connection = psycopg2.connect(login.credentials)
	cursor = connection.cursor()

	print('<main class=main>')  #begin main

	print('<section class="forms">')    #begin forms section

	# Making query
	sql = 'SELECT * FROM reservation;'
	print('<h2>Add Reservation</h2>')
	cursor.execute(sql)
	result = cursor.fetchall()
	num = len(result)
	print('<form action="add_reservation.cgi" method="post">')
	print('<p><input type="text" name="cni" placeholder="CNI"/></p>')
	print('<p><input type="text" name="iso_code_boat" placeholder="Iso code boat"/></p>')
	print('<p><input type="text" name="id_sailor" placeholder="ID Sailor"/></p>')
	print('<p><input type="text" name="iso_code_sailor" placeholder="Iso code sailor"/></p>')	
	print('<p><input type="text" name="start_date" placeholder="Start Date"/></p>')
	print('<p><input type="text" name="end_date" placeholder="End Date"/></p>')		
	print('<p><input type="submit" value="Submit"/></p>')
	print('</form>')

	print('</section>')  #end forms section

	print('<section class="tables">')   #begin section tables
	print('<div class="table1">')   #begin table 1

	# Displaying results
	print('<h2>List of Reservations</h2>')

	print('<p>Reservation Table: {} records retrieved:</p>'.format(num))
	print('<table border="5">')
	print('<tr><td>CNI</td><td>ISO Code Boat</td><td>ID Sailor</td><td>ISO Code Sailor</td><td>Start Date</td><td>End Date</td></tr>')
	for row in result:
		print('<tr>')
		for value in row:
			# The string has the {}, the variables inside format() will replace the {}
			print('<td>{}</td>'.format(value))
		print('<td><a href = "delete_reservation.cgi?cni={}&iso_code_boat={}&id_sailor={}&iso_code_sailor={}&start_date={}&end_date={}">Delete</a></td>'.format(row[0], row[1], row[2], row[3], row[4], row[5]))
		print('</tr>')

	print('</table>')

	print('</div>')   #end table 1

	print('<div class="table2">')   #begin table 2

	# Making query
	sql = 'SELECT * FROM sailor ORDER BY iso_code, id;'
	print('<h2>List of Sailors</h2>')
	cursor.execute(sql)
	result = cursor.fetchall()
	num = len(result)

	# Displaying results
	print('<p>Sailor Table: {} records retrieved:</p>'.format(num))
	print('<table border="5">')
	print('<tr><td>ID</td><td>ISO Code</td></tr>') 
	for row in result:
		print('<tr>')
		for value in row:
			print('<td>{}</td>'.format(value))
		print('</tr>')
	print('</table>')

	print('</div>')   #end table 1

	print('<div class="table3">')   #begin table 2

	# Making query
	sql = 'SELECT * FROM boat;'
	print('<h2>List of Boats</h2>')
	cursor.execute(sql)
	result = cursor.fetchall()
	num = len(result)

	# Displaying results
	print('<p>Boat Table: {} records retrieved:</p>'.format(num))
	print('<table border="5">')
	print('<tr><td>Name</td><td>Year</td><td>CNI</td><td>ISO Code</td><td>ID Owner</td><td>ISO Code Owner</td></tr>')
	for row in result:
		print('<tr>')
		for value in row:
			print('<td>{}</td>'.format(value))
		print('</tr>')
	print('</table>')
    
	print('</div>')  #end table 2
    #Closing connection
	cursor.close()

	print('</section>')  #end section tables

	print('</main>') #end main
	print('<footer class="footer">')

	print('<p><a href = "start.cgi">HomePage</a></p>')
except Exception as e:
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None: 
        connection.close()
print('</footer>')
print('</body>')
print('</html>')
