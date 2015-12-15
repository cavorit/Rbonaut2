#' @author Harald Fiedler
#' @title isUTF8
#' @description schätzt, ob UTF8 Codierung vorliegt
#' @details Diese Funktion funktioniert nur auf Mac, wobei hierzu per *brew install moreutils* installiert sein muss. Sie gibt character(0) zurück, wenn kein utf8-nonkonformes Zeichen gefunden wurde, und ansonsten eine Liste mit Angaben zu invaliden Zeichen
#' @param file character der Länge 1 der angibt, ob schätzungsweise UTF8 vorliegt
#' @examples
#' isUTF8(file="~/Desktop")
#' @return siehe *details*
#'
#'


isUTF8 <- function(file="*"){
  Befehl <- paste("isutf8", file, collapse = " ")
  SystemAntwort <- system(Befehl, intern=TRUE)
  Erg <- as.logical(length(SystemAntwort))
  return(Erg)
}
