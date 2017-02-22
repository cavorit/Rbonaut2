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

funfterBall = {
    "TestID" : "BL16a",
    "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a24",
    "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    "NamePlayer" : "Mustermann, Tim",
    "Birthday" : "2002-07-21",
    "Team" : "U14",
    "SessionStart" : "2014-03-22 13:42:03",
    "adrB" : [64,46,64,64,46],
    "adrW" : [68,36,42,70,38],
    "adrCol" : ['200,0,0','200,0,0','200,0,0','200,0,0','200,0,0'],
    "adrOut" : [68, 36, 42,70,38],
    "FBt" : [2140, 2600, 8600,8600,8600]
    }

siebterBall = {
    "TestID" : "BL32",
    "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a25",
    "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    "NamePlayer" : "Mustermann, Tim",
    "Birthday" : "2002-07-21",
    "Team" : "U14",
    "SessionStart" : "2014-03-22 13:42:03",
    "adrB" : [10, 45, 28,46,64,10],
    "adrW" : [[4, 6],[21, 22],[50, 18],[36,4],[54,6],[22,21]],
    "adrCol" : [["A", "B"],["A", "B"],["B", "A"],["A", "B"],["A", "B"],["B", "A"]],
    "adrOut" : [4, 23, 50, 34,54,20],
    "FBt" : [2140, 2600, 8600,2140, 2600, 8600]
    }

siebzehnterBall = {
    "TestID" : "BL32",
    "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a25",
    "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    "NamePlayer" : "Mustermann, Tim",
    "Birthday" : "2002-07-21",
    "Team" : "U14",
    "SessionStart" : "2014-03-22 13:42:03",
    "adrB" : [10, 45, 28, 46, 64,10,46, 27,63,10,9,64,28,27,10, 45],
    "adrW" : [[4, 6],[21, 22],[50, 18],[36,4],[54,6],[22,21], [36,72], [20,18],[68,1],[4,6],[22,1],[68,2],[72,12],[72,13],[62,18],[6,44]],
    "adrCol" : [["A", "B"],["A", "B"],["B", "A"],["A", "B"],["A", "B"],["B", "A"],["A", "B"],["A", "B"],["B", "A"],["A", "B"],["A", "B"],["B", "A"],["A", "B"],["A", "B"],["B", "A"],["A", "B"]],
    "adrOut" : [4, 23, 50, 34,54,20, 36,20,66,5,22,68,72,71,62,5],
    "FBt" : [2140, 2600, 8600,2140, 2600, 8600,2140, 2600, 8600,2140, 2600, 860,2140, 2600, 8600,2140]
    }

data = siebzehnterBall

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


