# rm(list=ls())

modelRequire <- function(){
  library(Rbonaut2)
  library(catR)
  library(jsonlite)
}

modelTransform <- function(x){
  x <- adaptiv.BL16.fullRandom.modelTransform(AnfrageJSONstring = x)
}

modelPredict <- function(x){
  #Ergebnis <- adaptiv.BL16.fullRandom.modelPredict(AnfrageDF=x)
  Ergebnis <- adaptiv.BL16.modelPredict(AnfrageDF=x)
  return(jsonlite::toJSON(Ergebnis))
}


