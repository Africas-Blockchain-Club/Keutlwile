import mysql.connector

def config():
    try:
        db_connection = mysql.connector.connect(
            host="1234",
            user="KeyMan",
            password="password",
            # database ="database"
        )
    except Exception as e:
        print("Could not connect to the database.")
    else:
        print("Connected to the database.")

    cursor = db_connection.cursor()

    return db_connection
