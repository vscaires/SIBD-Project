#!/usr/bin/python3
import psycopg2
import login 

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Boat Management System</title>')
print('<link rel="stylesheet" href="CSS/general.css">')
print('<link rel="stylesheet" href="CSS/style_boat.css">')
print('</head>')
print('<body>')
connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    # print('<p>Connected to Postgres with: {}.</p>'.format(login.credentials[:51])) 
    cursor = connection.cursor()
    
    print('<main class=main>')  #begin main

    print('<section class="forms">')    #begin forms section

    # Making query
    sql = 'SELECT * FROM boat;'
    print('<h2>Add Boat</h2>')

    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    print('<form action="add_boat.cgi" method="post">')
    print('<p><input type="text" name="cni" placeholder="CNI"/></p>')
    print('<p><input type="text" name="iso_code" placeholder="Iso Code"/></p>')
    print('<p><input type="text" name="name" placeholder="Name"/></p>')
    print('<p><input type="text" name="year" placeholder="Year"/></p>')	
    print('<p><input type="text" name="id_owner" placeholder="ID owner"/></p>')
    print('<p><input type="text" name="iso_code_owner" placeholder="Iso code owner"/></p>')		
    print('<p><input type="text" name="mmsi" placeholder="MMSI"/></p>')
    print('<p><input type="submit" value="Submit"/></p>')
    print('</form>')

    print('</section>')  #end forms section

    print('<section class="tables">')   #begin section tables
    print('<div class="table1">')   #begin table 1

    print('<h2>List of Boats</h2>')
    # Displaying results
    print('<p>Boat Table: {} records retrieved:</p>'.format(num))
    print('<table border="5">')
    print('<tr><td>Name</td><td>Year</td><td>CNI</td><td>ISO Code</td><td>ID Owner</td><td>ISO Code Owner</td></tr>')
    for row in result:
        print('<tr>')
        for value in row:
            # The string has the {}, the variables inside format() will replace the {}
            print('<td>{}</td>'.format(value))
        print('<td><a href="delete_boat.cgi?cni={}&iso_code={}">Remove Boat</a></td>'.format(row[2],row[3]))
        print('</tr>')

    print('</table>')

    print('</div>')   #end table 1

    print('<div class="table2">')   #begin table 2

    # Making query
    sql = 'SELECT * FROM owner ORDER BY iso_code, id;'
    print('<h2>List of Owners</h2>')
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<p>Owner Table: {} records retrieved:</p>'.format(num))
    print('<table border="5">')
    print('<tr><td>ID</td><td>ISO Code</td><td>Birthdate</td></tr>') 
    for row in result:
        print('<tr>')
        for value in row:
        # The string has the {}, the variables inside format() will replace the {}
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
