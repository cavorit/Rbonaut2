#' @author Harald Fiedler
#' @title writeRAW
#' @param Dateiname character der Länge 1, gibt den Dateinamen ohne Endung an. Der Pfad ist hard coded zur Dropbox
#' @param SQL data.frame der per askDB() erzeugte Datensatz
#' @description Der per askDB() erzeugte Datensatz (ein data.frame) wird als R-Objekt in der Dropbox abgespeichert.


writeRAW <- function(SQL, Dateiname){

  path <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/RAW/"
  path <- paste0(path, Dateiname, collapse = "/")
  #path <- paste0(path, ".csv")

#   write.table(x=DF,
#               file=path,
#               col.names = TRUE,
#               fileEncoding = "utf8",
#               sep=";",
#               quote = FALSE,
#               dec = ".",
#               row.names = FALSE,
#               append = FALSE
#   )
#
  save(SQL, file = path)
}
