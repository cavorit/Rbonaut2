# pip install pycurl

import pycurl
import cStringIO
import json
from urllib import urlencode


Modell = "test" # das zu testenden Model muss ~/models/test.r heissen (kleines r)


data = {
        "TestID" : "cs32",
        "idS" : "002b6573-cf12-436d-bc45-0856b0bb0a77",
        "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
        "NamePlayer" : "Mustermann, Tim",
        "Birthday" : "2007-10-10",
        "Team" : "U23",
        "SessionStart" : "2014-03-22 13:42:03",
        "adrB" : [64, 28, 10],
        "adrW" : [68, 72, 22],
        "adrOut" : [68, 72, 4],
        "FBt" : [2140, 2600, 2300]
    }

anfrage = json.dumps(data)
buf = cStringIO.StringIO()
c = pycurl.Curl()
c.setopt(pycurl.URL, '172.16.1.102:5000/models/test')

c.perform()
c.close()
print buf.getvalue()
buf.close()
