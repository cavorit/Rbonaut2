#' @author Harald Fiedler
#' @description Hilfsfunktion von SQL2DF()
#' @details In den DB-Abfragen von CGoal findet sich die Variable adrW für die Zielfelder.
#' Beim Umstellen von Single-Target auf Multi-Target wurde aus einer Zahl nun einen String, der einen JSON-Vektor darstellt.
#' Wenn also Früher nur das Zielfeld 7 angegeben war, kann bei Multitarget nun der Ausdruck "{7, 2, 21}" angegeben sein.
#' Die hier volriegende Funktion arbeitet Vektorwertig und macht beispielsweise aus den Tabelleneinträgen
#' c("{1, 2, 3, 4}", "{11, 12, 13, 14}") eine List der Form list(c(1, 2, 3, 4), c(11, 12, 13, 14))
#' @title getAdrWAlsListe
#' @param adrW character
#' @return list mit numerischen Elementen
#' @examples
#' adrW <- c("{1, 2, 3, 4}", "{11, 12, 13, 14}")
#' getAdrWAlsListe(adrW = adrW)

getAdrWAlsListe <- function(adrW){
  VektorLaenge <- length(adrW)
  WortLaenge <- nchar(adrW)

  OhneGeschweifteKlammer <- NULL
  for (i in 1:VektorLaenge){
    OhneGeschweifteKlammer <- c(OhneGeschweifteKlammer, substr(adrW[i], 2, WortLaenge[i]-1))
  } # c("1, 2, 3" , "11, 12, 13")
  Erg <- lapply(strsplit(OhneGeschweifteKlammer, split = ", "), FUN = as.numeric)
  # list(c(1, 2, 3) , c(11, 12, 13))
  return(Erg)
}




