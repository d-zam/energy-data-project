# This file will download the .csv file from the SPP website.
# This code will run from EC2 instance on AWS, downloading locally on cloud computer to then process within AWS.

import sys
import csv
import requests
import datetime

lat = sys.argv[1]
lon = sys.argv[2]
dt = sys.argv[3]
filename = sys.argv[4]

url = 'https://api.openweathermap.org/data/2.5/onecall/timemachine?lat='+lat+'&lon='+lon+'&units=imperial&dt='+dt+'&appid=e7f1cbc5a7fbfe9f0b89237ade4f02dc'

filetime = datetime.datetime.now()
dwnld = requests.get(url, verify = False)
dwnld_file = dwnld.content
json_file = open(filename, 'wb')
#csv_file = open(sys.argv[2] + '_' + str(filetime.strftime("%Y-%m-%d_%H-%M")) + '.csv', 'wb')
json_file.write(dwnld_file)
json_file.close()
