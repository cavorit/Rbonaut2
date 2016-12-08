#' @author Harald Fiedler
#' @description Hilfsfunktion von augmentDF(): Gibt aus einem Spielername den Vornamen
#' @details Spielernamen können in SQL-Abfragen des FBN beispielsweise "Dogan, Isa" sein. Es wird "Isa" zurückgegeben.
#' @title getVorname
#' @param Spielername character Vektor von beliebiger Länge
#' @return character Vektor der gleichen Länge wie der an die Funktion übergebene Vektor
#' @examples
#' Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
#' getVorname(Spielername = Spielername)

getVorname <- function(Spielername){
  Erg <- rep(NA, times=length(Spielername))
  Vornamen <- NULL
  for (i in strsplit(Spielername, split = ",")){
    Vornamen <- c(Vornamen, i[2])
  }
  Wo <- istFormatNachnameKommaVorname(Spielername)
  Erg[Wo] <- Vornamen[Wo]
  Erg <- gsub(Erg, pattern = " ", replacement="") # nimmt Leerzeichen raus
  return(Erg)
}




