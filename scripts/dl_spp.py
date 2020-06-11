# This file will download the .csv file from the SPP website.
# This code will run from EC2 instance on AWS, downloading locally on cloud computer to then process within AWS.

import sys
import csv
import requests
import datetime

filetime = datetime.datetime.now()
dwnld = requests.get(sys.argv[1], verify = False)
dwnld_file = dwnld.content
csv_file = open(sys.argv[2] + '.csv', 'wb')
#csv_file = open(sys.argv[2] + '_' + str(filetime.strftime("%Y-%m-%d_%H-%M")) + '.csv', 'wb')
csv_file.write(dwnld_file)
csv_file.close()
