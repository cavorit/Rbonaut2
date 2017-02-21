#' @author Harald Fiedler
#' @title gibZahlFuehrendeNullen
#' @description Hilfsfunktion von SQL2DF: aus c(3) mach c("003")
#' @details Wenn man idX <- 1:31 nutzt, um einen Index idB zu erstellen, erhält man einen eindeutigen Schlüßel. Allerdings
#' verhält sich die lexikografische Sortierung nicht, wie man es vielleicht möchte. So würde auf die idB=1 nicht etwa idB=2
#' folgen, sondern idB=11. Daher macht es Sinn, bei der Konvertiertung einer Ziffer oder Zahl in ein Character
#' eine gewisse Anzahl an Nullen voranzustellen. So wird etwa aus der Zahl 2 das Wort "002" gemacht, wodurch die lexikografische
#' Sortierung wieder so funktioniert, wie man es gerne hätte.
#' @examples
#' k = c(2, 7, 17, 299)
#' gibZahlFuehrendeNullen(k=k, digits=9)
#' @param k numeric (besser wäre integer, sonst wird das Ergebnis korrumpiert)
#' @param digits numeric der Länge 1, das die Wortlänge bezeichnet. "0004" erhält man beispielsweise mit digits=4
#' @return Ein Vektor mit der gleichen Länge wie k, dessen Elemente Worte sind. Sie example.


gibZahlFuehrendeNullen <- function(k, digits=3){

  k <- 10**digits+k
  k <- strsplit(as.character(as.integer(k)), split="")
  ERG <- NULL

  for (i in 1:length(k)){
    ERG <- c(ERG,   paste0(k[[i]][2:(digits+1)], collapse = ""))
  }

  return(ERG)

}


