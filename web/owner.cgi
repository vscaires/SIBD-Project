#!/usr/bin/python3
import psycopg2
import login 

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Boat Management System</title>') 
print('<link rel="stylesheet" href="CSS/general.css">')
print('<link rel="stylesheet" href="CSS/style_owner.css">')
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
    sql = 'SELECT id, iso_code, birthdate FROM owner ORDER BY iso_code, id;'
    print('<h2>List of Owners</h2>')
    
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)

    print('<h3>Add Owner</h3>')
    print('<form action="add_owner.cgi" method="post">') 
    print('<p><input type="text" name="id" placeholder="ID"/></p>')
    print('<p><input type="text" name="iso_code" placeholder="ISO Code"/></p>')
    print('<p><input type="text" name="birthdate" placeholder="Birthdate"/></p>')
    print('<p><input type="submit" value="Submit"/></p>')

    print('</form>')

    print('</section>')  #end forms section

    print('<section class="tables">')   #begin section tables
    print('<div class="table1">')   #begin table 1 

    # Displaying results
    print('<p>Owner Table: {} records retrieved:</p>'.format(num))
    print('<table border="5">')
    print('<tr><td>ID</td><td>ISO Code</td><td>Birthdate</td></tr>') 
    for row in result:
        print('<tr>')
        for value in row:
        # The string has the {}, the variables inside format() will replace the {}
            print('<td>{}</td>'.format(value))
        print('<td><a href = "delete_owner.cgi?id={}&iso_code={}">Delete</a></td>'.format(row[0], row[1]))
        print('</tr>')
    print('</table>')

    print('</div>')   #end table 1

    print('<div class="table2">')   #begin table 2

     # Making query
    sql = 'SELECT id, iso_code FROM person ORDER BY iso_code, id;'
    # print('<p>{}</p>'.format(sql))
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    
    # Displaying results
    print('<p>Person Table: {} records retrieved</p>'.format(num))
    print('<table border="5">')
    print('<tr><td>ID</td><td>ISO Code</td></tr>') 
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
