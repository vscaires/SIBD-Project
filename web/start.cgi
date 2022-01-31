#!/usr/bin/python3 
import psycopg2
import login 

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

    print('<h1>Boat Management System</h1>')
    print('<p><a href = "owner.cgi">Register and remove owners</a></p>')
    print('<p><a href = "boat.cgi">Register and remove boats including boats with VHF station</a></p>')
    print('<p><a href = "sailor.cgi">Insert, list and remove boat sailors</a></p>')
    print('<p><a href = "reservation.cgi">Create and remove reservations</a></p>')
except Exception as e:
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()

print('</body>')
print('</html>')
