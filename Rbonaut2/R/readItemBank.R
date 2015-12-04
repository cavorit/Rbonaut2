#' @author Harald Fiedler
#' @title readItemBank
#' @description Liest die ItemBank ein
#' @details Es wird die ItemBank im 1:4PL-Modell eingelesen.
#' @param Pfad character der Länge 1, der den Pfadname zu einer .csv-Datei darstellt. Die Datei muss eine gültige ItemBank im Sinne des 4-PL-Modells sein.
#' Als Default-Wert für den Pfad fungiert ein Pfad zu einer Pakte-Datei, die in der Lib installiert wurde (was der eigentliche Clou dieser Funktion ist).
#' @return data.frame für das 4PL-Modell
#'


readItemBank <- function(file=NA){

  if (is.na(file)){Pfad <- system.file("extdata", package="Rbonaut2", "ItemBank.csv")}
  ItemBank <- read.csv2(file = Pfad, header = TRUE, sep = ";", encoding = "utf8")

  return(ItemBank)
}



