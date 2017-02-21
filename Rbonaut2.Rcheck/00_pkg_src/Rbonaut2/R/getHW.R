#' @author Harald Fiedler
#' @title getHW
#' @description Hilfsfunktion von augmentRAW zur Ermittlung von Höhenwinkel FF-FH-HF-HH
#' @details Je nachdem ob eine obere Ballkanonen oder eine untere Ballkanone zum Zuge kommt, oder ein unteres Zeil respektive oberes Ziel, kommt ein anderer Höhenwinkle zu stande.
#' @param SQL data.frame welches durch read.csv() einer SQL-Query entnommen wurde
#' @return character mit Einträgen aus c("FF", "FH", "HF", "HH"), wobei FF=Flach Flach bedeutet und HH=Hoch Hoch.
#'
#'

getHW <- function(SQL){
  adrM <- SQL$adrm
  adrW <- getFirstAdrW(adrW=SQL$adrw)
  Buchstabe1 <- rep(NA, times=length(adrM))
  Buchstabe2 <- rep(NA, times=length(adrW))

  Buchstabe1[adrM%%2==0] <- "F"
  Buchstabe1[adrM%%2!=0] <- "H"
  Buchstabe2[adrW%%2==0] <- "F"
  Buchstabe2[adrW%%2!=0] <- "H"

  Erg <- paste0(Buchstabe1, Buchstabe2)
  return(Erg)
}

