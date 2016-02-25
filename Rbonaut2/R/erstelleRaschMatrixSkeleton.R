#' @author Harald Fiedler
#' @title erstelleRaschMatrixSkeleton
#' @description erstellte eine NA-Matrix mit den Sessions als Zeilenindex und den Item-Namen als Spaltenindex
#' @details Achtung: eine Spalte des data.frame muss den Spaltennamen "idS" haben.
#' @param DF data.frame auf Ballebene. Eine Spalte muss "idS".
#' @param ItemIDNamen character array mit den Itembezeichnungen, für die eine Rasch-Matrix erstellt werden soll.
#' @return Eine Matrix voller NA, mit colnames=Itembezeichnungen und rownames=unique(idS)
#' @examples
#' rm(list=ls())
#' DF <- data.frame(c("SessionA", "SessionB"), c(22, 90), c(23, 18), c(10,12))
#' colnames(DF) <- c("idS", "It1", "It2", "It_von_wo_ganz_anders")
#' ItemIDNamen <- c("Item1", "Item2", "Item3")
#' print(DF)
#' erstelleRaschMatrixSkeleton(DF=DF, ItemIDNamen=ItemIDNamen)
#'

erstelleRaschMatrixSkeleton <- function(DF, ItemIDNamen){
  ## erstelle RaschMatrix-Skeletton
  SessionIndex <- unique(DF$keyS)
  RaschMatrixSkeleton <- matrix(NA, ncol=length(ItemIDNamen), nrow=length(SessionIndex))
  colnames(RaschMatrixSkeleton) <- ItemIDNamen
  rownames(RaschMatrixSkeleton) <- unique(DF$keyS)
  return(RaschMatrixSkeleton)
}
