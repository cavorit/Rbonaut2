#' @author Harald Fiedler
#' @description Hilfsfunktion von augmentRAW()
#' @details In den SQL-Auszügen des FBN finden sich Spielername vom Format "Fiedler, Harald", aber auch "A_TEST_Forschung". Die Funktion testet komponentenweise, ob zwei Strings kommagetrennt gepastet sind.
#' @param Spielername String
#' @return Boolescher Wert, der angibt, ob das Format Name, Vorname (mutmaßlich) vorliegt
#' @title istFormatNachnameKommaVorname
#' @examples
#' Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
#'istFormatNachnameKommaVorname(Spielername = Spielername)

istFormatNachnameKommaVorname <- function(Spielername){

  Liste <- strsplit(Spielername, ",")
  return(lapply(Liste, FUN = length)==2)
}


