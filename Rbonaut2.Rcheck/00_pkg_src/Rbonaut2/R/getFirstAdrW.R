#' @author Harald Fiedler
#' @title getFirstArdW
#' @param adrW character Vektor, etwa c("{2, 4, 5}", "{12,19}", "{4}")
#' @return numeric
#' @description Hilfsfunktion von SQL2DF(): Gibt erstes Ziel in adrW im numerischen Format
#' @details Bei der Umstellung von Single-Target auf Multi-Target wurden die Einträge in der FBN-Datenbank stark abgeändert. Wo früher beispielsweise eine Zahl 7 für das Zielfeld mit der Adresse 7 stand, ist nun "{3, 5, 15}" ein String,
#' der die unterschiedlichen Zielfelder darstellt. Unabhängig davon, ob in adrW ein multiTarget oder singleTarget-Design hinterlegt wird, liefert diese Funktion nur das erste Ziel zurück, und zwar als Zahl.
#' @examples
#' getFirstAdrW(adrW=c("{2, 4, 5}", "{12, 19}", "{4}"))

getFirstAdrW <- function(adrW){
  Erg <- rep(NA, times=length(adrW))

  ListeAdrW <- getAdrWAlsListe(adrW)
  First <- NULL
  for (i in 1:length(ListeAdrW)){
    First <- c(First, as.numeric(ListeAdrW[[i]][1]))
  }
  return(First)
}




