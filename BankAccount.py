import mysql.connector
import tkinter

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Gigi19970113",
    database = "bank"
)
myCursor = mydb.cursor()


firstName = input("First Name: ")
lastName = input("Last Name: ")
userId = input("User Id: ")
password = input("Password: ")
values = (firstName, lastName, userId, password)
customerTableSql = '''INSERT INTO customertable (firstName,lastName,userId,password) VALUES (%s,%s,%s,%s)'''
myCursor.execute(customerTableSql,values)
mydb.commit()
print(myCursor.rowcount, "Record was inserted")
myCursor.close()
mydb.close()
