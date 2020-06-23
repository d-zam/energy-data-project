import psycopg2
import sys

output = "No output"
connection = ""
sqlfile = sys.argv[1]
sqltext = ""
with open(sqlfile, 'r') as file:
	sqltext = file.read()
if (len(sys.argv) > 2):
	sqltext = sqltext.replace("$1", sys.argv[2])
#print(sqltext)

try:
        connection = psycopg2.connect(user = "*****",
                                    password = "*****",
                                    host = "*****",
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
