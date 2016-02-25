#' @author Harald Fiedler
#' @title writeRAW
#' @param Dateiname character der Länge 1, gibt den Dateinamen ohne Endung an. Der Pfad ist hard coded zur Dropbox
#' @param SQL data.frame der per askDB() erzeugte Datensatz
#' @description Der per askDB() erzeugte Datensatz (ein data.frame) wird als R-Objekt in der Dropbox abgespeichert.


writeRAW <- function(SQL, Dateiname){

  path <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/RAW/"
  path <- paste0(path, Dateiname, collapse = "/")
  save(SQL, file = path)
}
