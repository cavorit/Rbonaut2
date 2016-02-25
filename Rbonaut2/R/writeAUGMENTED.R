#' @author Harald Fiedler
#' @title writeAUGMENTED
#' @param Dateiname character der Länge 1, gibt den Dateinamen ohne Endung an. Der Pfad ist hard coded zur Dropbox
#' @param DF data.frame der per augmentRAW() erzeugte Datensatz
#' @description Der per augmentRAW() erzeugte Datensatz (ein data.frame) wird als R-Objekt in der Dropbox abgespeichert.


writeAUGMENTED <- function(DF, Dateiname){

  path <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/RAW/AUGMENTED"
  path <- paste0(path, Dateiname)
  save(DF, file = path)
}
