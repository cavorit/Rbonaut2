#' @author Harald Fiedler
#' @title readAUGMENTED
#' @description Liest die per writeAUGMENTED() gespeicherten Dateien ein
#' @param Dateiname character der Länge 1 mit Dateiname (ohne Endung). Der Pfad wird automatisch auf die Dropbox gesetzt, genauer in den Ordner RAW vom Ordner Hoffenheim
#' @param Pfad CharacterString mit Pfadangabe zur Dropbox
#' @examples
#' #Dateiname = "RAW-2015-04"
#' #head(readAUGMENTED(Dateiname = Dateiname))
#'

readAUGMENTED <- function(Dateiname, Pfad = "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/RAW/"){
  path <- paste0(Pfad, Dateiname, collapse = "/")
  load(file = path, verbose = TRUE, envir = .GlobalEnv)
}
