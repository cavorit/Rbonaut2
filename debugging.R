rm(list=ls())

modelRequire()

problem_request <- jsonlite::toJSON(
  list(
    TestID = "BL16",
    idS = "002b6573-cf12-436d-bccd-0856b0bb0a21",
    idP = "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    NamePlayer = "Christian_Prob",
    Birthday = "1970-01-01",
    Team = "Test & Technik",
    SessionStart = "2017-02-20T12:42:15.660844+00:00",
    adrB = c(64, 46, 64,64,46),
    adrW = c(68,36,42,70,38),
    adrCol = list("200,100,0","200,100,0","200,100,0","200,100,0","200,100,0"),
    adrOut = c(68,36,42,70,38),
    FBt = c(3284,3415,7744,3870,3094)
  )
)


AnfrageJSONstring <- problem_request

AnfrageDF <- modelTransform(x = AnfrageJSONstring)
modelPredict(AnfrageDF)


# Zwei Exception wurden hinzugefügt.
# 1. Wenn alle Bälle einem Item zugeordnet werden können, werden die Rotationswinkel nicht verglichen (bugg)
# 2. Wenn kein Ball identifiziert werden kann auch nach Rotation, wird das Skript gestoppt mit der Fehlermeldung
# 'Footbonaut meldet ausschließlich nicht indizierbare Items!'


keine_Identitaet = jsonlite::toJSON(
  list(
    TestID = "BL16a",
    idS = "002b6573-cf12-436d-bccd-0856b0bb0a22",
    idP = "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    NamePlayer = "Mustermann, Tim",
    Birthday = "2002-07-21",
    Team = "U14",
    SessionStart = "2014-03-22 13:42:03",
    adrB = c(10,45,10,45,10),
    adrW = c(12,10,12,10,12),
    adrCol = list('1,95,169','1,95,200','1,95,169','1,95,200','1,95,169'),
    adrOut = c(4,4,4,4,4),
    FBt = c(2140,3284,3415,4586,8685)
  )
)


AnfrageJSONstring <- keine_Identitaet

AnfrageDF <- modelTransform(x = AnfrageJSONstring)
modelPredict(AnfrageDF)
