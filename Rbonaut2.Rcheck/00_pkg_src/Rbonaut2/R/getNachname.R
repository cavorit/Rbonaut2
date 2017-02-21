#' @author Harald Fiedler
#' @description Hilfsfunktion von augmentRWA(): Gibt aus einem Spielername den Vornamen
#' @details Spielernamen können in SQL-Abfragen des FBN beispielsweise "Dogan, Isa" sein. Es wird "Isa" zurückgegeben.
#' @title getNachname
#' @param Spielername character Vektor von beliebiger Länge
#' @return character Vektor der gleichen Länge wie der an die Funktion übergebene Vektor
#' @examples
#' Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
#' getNachname(Spielername = Spielername)


getNachname <- function(Spielername){
  Erg <- rep(NA, times=length(Spielername))
  Nachname <- NULL
  for (i in strsplit(Spielername, split = ",")){
    Nachname <- c(Nachname, i[1])
  }
  Wo <- istFormatNachnameKommaVorname(Spielername)
  Erg[Wo] <- Nachname[Wo]
  Erg <- gsub(Erg, pattern = " ", replacement="") # nimmt Leerzeichen raus
  return(Erg)
}



