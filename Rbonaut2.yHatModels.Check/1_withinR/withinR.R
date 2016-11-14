###### Teststufe 1 #############################################################################
# Testung innerhalb einer .GlobalEnv in R

rm(list=ls())


ersterBall <- jsonlite::toJSON(
  list(
    TestID = "BL32",
    idS = "002b6573-cf12-436d-bccd-0856b0bb0a21",
    idP = "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    NamePlayer = "Mustermann, Tim",
    Birthday = "2002-07-21",
    Team = "U14",
    SessionStart = "2014-03-22 13:42:03",
    adrB = list(), # weil in Python/jsonlite [] zu list() wird und nicht zu c()
    adrW = list(),
    adrCol = list(),
    adrOut = list(),
    FBt = list()
  )
)

zweiterBall = jsonlite::toJSON(
  list(
    TestID = "BL16a",
    idS = "002b6573-cf12-436d-bccd-0856b0bb0a22",
    idP = "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    NamePlayer = "Mustermann, Tim",
    Birthday = "2002-07-21",
    Team = "U14",
    SessionStart = "2014-03-22 13:42:03",
    adrB = c(10),
    adrW = list(c(4,6)),
    adrCol = list(c("A", "B")),
    adrOut = c(4),
    FBt = c(2140)
  )
)

vierterBall <- jsonlite::toJSON(
  list(
    TestID = "BL32",
    idS = "002b6573-cf12-436d-bccd-0856b0bb0a25",
    idP = "fe553db4-bbde-43dd-a6a0-804b9e46c57",
    NamePlayer = "Mustermann, Tim",
    Birthday = "2002-07-21",
    Team = "U14",
    SessionStart = "2014-03-22 13:42:03",
    adrB = c(10, 45, 28),
    adrW = list(
              c(4, 6),
              c(21, 22),
              c(50, 18)
            ),
    adrCol = list(
                c("A", "B"),
                c("A", "B"),
                c("B", "A")
              ),
    adrOut = c(4, 23, 40),
    FBt = c(2140, 2600, 8600)
  )
)

AnfrageJSONstring <- get(paste0(c("erster", "zweiter", "vierter"), "Ball")[3])

# modelRequire()
AnfrageDF <- modelTransform(x = AnfrageJSONstring)
print(AnfrageDF)
modelPredict(AnfrageDF) # https://jsonformatter.curiousconcept.com : Output ist valides JSON
####################################################################################################

