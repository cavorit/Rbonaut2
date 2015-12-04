#' @author Harald Fiedler
#' @description adrW-Einträge als numerische Liste
#' @details Aus c("{1, 2, 3, 4}", "{11, 12, 13, 14}") mach mache list(c(1, 2, 3, 4), c(11, 12, 13, 14))
#' @title getAdrWAlsListe
#' @param adrW character
#' @return list mit numerischen Elementen

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

#  adrW <- c("{1, 2, 3, 4}", "{11, 12, 13, 14}")
#  getAdrWAlsListe(adrW = adrW)


