import psycopg2
import sys

output = "No output"
connection = ""
sqlfile = sys.argv[1]
sqltext = ""
with open(sqlfile, 'r') as file:
	sqltext = file.read()
#print(sqltext)

try:
        connection = psycopg2.connect(user = "postgres",
                                    password = "enrg1994",
                                    host = "127.0.0.1",
                                    port = "5432",
                                    database = "StageEnergyPricing")

        cursor = connection.cursor()

    # Print PostgreSQL version
        cursor.execute(sqltext)
        connection.commit()
        #record = cursor.fetchone()
        #output = "You are connected to - ", record,"\n"

except (Exception, psycopg2.Error) as error :
        output = "Error: " + str(error)
finally:
    #closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            #print("PostgreSQL connection is closed")
print(output)
