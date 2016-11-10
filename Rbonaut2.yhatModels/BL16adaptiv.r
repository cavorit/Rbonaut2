rm(list=ls())
library(Rbonaut2)
library(jsonlite)

modelRequire <- function(){
  library(Rbonaut2)
  library(catR)
  library(jsonlite)
}

modelTransform <- function(x){
  x <- adaptiv.BL16.fullRandom.modelTransform(AnfrageJSONstring = x)
}

modelPredict <- function(x){
  #adaptiv.BL16.fullRandom.modelPredict(AnfrageDF=x)
  return(jsonlite::toJSON(x))
}


###### Teststufe 1 ######  
# Testung innerhalb einer .GlobalEnv in R



Anfrage <- jsonlite::toJSON(
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

# modelRequire()
modelTransform(x = Anfrage)
