#' @author Harald Fiedler
#' @description Hilfsfunktion von SQL2DF(): ermittelt Sessionstart
#' @details Macht aus 2015-08-27 18:59:25.328383+02 den String 18:59:25
#' @title getSessionTimeStamp
#' @param DatumString String, etwa "2015-08-27 18:59:25.328383+02"
#' @return Ein String, etwas "18:59:25"
#' @examples
#' DatumString <- c("2015-08-27 18:59:25.328383+02", "2015-08-27 18:59:25.328383+02", "2015-08-27 18:59:25.328383+02")

getSessionTimeStamp <- function(DatumString){
  # c("2015-08-27 18:59:25.328383+02", "2015-08-27 18:59:25.328383+02", "2015-08-27 18:59:25.328383+02")
  Liste <- strsplit(x = DatumString, split = " ")

  TS <- NULL
  for (i in Liste){
    TS <- c(TS, i[2])
  }

  Erg <- NULL
  StundeMinuteSekundeHundertstel <- strsplit(x = TS, split = "[.]")
  for (i in StundeMinuteSekundeHundertstel){
    Erg <- c(Erg, i[1])
  }
  return(Erg)
}


