# pip install pycurl

import pycurl
import cStringIO
import json
from urllib import urlencode


Modell = "test"  


ersterBall = {
    "TestID" : "BL16a",
    "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a251",
    "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    "NamePlayer" : "Mustermann, Tim",
    "Birthday" : "2002-07-21",
    "Team" : "U14",
    "SessionStart" : "2014-03-22 13:42:03",
    "adrB" : [],
    "adrW" : [],
    "adrCol" : [],
    "adrOut" : [],
    "FBt" : []
    }



zweiterBall = {
    "TestID" : "BL16a",
    "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a22",
    "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    "NamePlayer" : "Mustermann, Tim",
    "Birthday" : "2002-07-21",
    "Team" : "U14",
    "SessionStart" : "2014-03-22 13:42:03",
    "adrB" : [10],
    "adrW" : [[4, 6]],
    "adrCol" : [["A", "B"]],
    "adrOut" : [4],
    "FBt" : [2140]
    }

vierterBall = {
    "TestID" : "BL16a",
    "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a24",
    "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    "NamePlayer" : "Mustermann, Tim",
    "Birthday" : "2002-07-21",
    "Team" : "U14",
    "SessionStart" : "2014-03-22 13:42:03",
    "adrB" : [10, 45, 28],
    "adrW" : [[4, 6], [21, 22], [50, 18]],
    "adrCol" : [["A", "B"], ["A", "B"], ["B", "A"]],
    "adrOut" : [4, 23, 40],
    "FBt" : [2140, 2600, 8600]
    }


data = ersterBall

anfrage = json.dumps(data)
buf = cStringIO.StringIO()
c = pycurl.Curl()
c.setopt(pycurl.URL, 'localhost:5000/models/test')


c.setopt(pycurl.POSTFIELDS, anfrage)
c.setopt(c.WRITEFUNCTION, buf.write)

c.perform()
c.close()
print buf.getvalue()
buf.close()


