#' @author Harald Fiedler
#' @title getFirstArdW
#' @param adrW character Vektor, etwa c("{2, 4, 5}", "{12,19}", "{4}")
#' @return numeric
#' @description Gibt erstes Ziel in adrW
#' @details Unabhängig davon, ob in adrW ein multiTarget oder singleTarget-Design hinterlegt wird, wird das erste Ziel zurückgegeben.

getFirstAdrW <- function(adrW){
  Erg <- rep(NA, times=length(adrW))

  ListeAdrW <- getAdrWAlsListe(adrW)
  First <- NULL
  for (i in 1:length(ListeAdrW)){
    First <- c(First, as.numeric(ListeAdrW[[i]][1]))
  }
  return(First)
}




