import mysql.connector

conn = mysql.connector.connect(user='me', password='myUserPassword', database='2020_Olympics_19769390')

cursor = conn.cursor()

#running a query
query = ("SELECT a.athleteName FROM Athletes a WHERE a.disciplineName = 'Judo' AND DATEDIFF(SYSDATE(), a.dob)/365 > 35")

cursor.execute(query)
for (athleteName) in cursor:
    print("{} is an old Judo player".format(athleteName))

#using a stored procedure
args = ['_veryNewCountry', -5, 1, 1]
cursor.callproc('insertCountry', args)

cursor.close()
conn.close()
