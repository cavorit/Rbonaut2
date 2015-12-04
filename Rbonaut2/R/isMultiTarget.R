#' @author Harald Fiedler
#' @title isMultiTarget
#' @param adrW character Array, etwa c("{22, 33, 44, 55}", "{11, 22222, 11111}", "{99}")
#' @return boolescher Vektor
#' @description Hilfsfunktion von SQL2DF(): ist adrW multitargetting?
#' @details Sagt, ob {11, 21, 16} oder {23} unter adrW abgespeichert wurde



isMultiTarget <- function(adrW){
  ZieleListe <- getAdrWAlsListe(adrW = adrW)
  unlist(lapply(ZieleListe, length)) != 1
}

#'  # norun
#' adrW <- head(SQL,1)$adrw
#' adrW <- c("{22, 33, 44, 55}", "{11, 22222, 11111}", "{99}")
#' isMultiTarget(adrW=adrW)
