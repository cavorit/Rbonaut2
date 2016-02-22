#' @author Harald Fiedler
#' @title implodeFilledRaschMatrixSkeleton4Quality
#' @description Lässt alle Probanden/Sessions weg, die zu viele NA haben, um eine sinnvolle ItemAnylse durchzuführen.
#' @param RaschMatrixSkeletonFilled matrix bestehend aus vielen NA und einigen 0 und 1en, wie man sie aus fillRaschMatrixSkeleton() erwirbt
#' @param MissingToleranz numeric der Länge 1. Wie viel Prozent fehlende Bälle werden höchstens erlaubt. Default ist 10 Prozent
#' @return matrix bestehend aus 0en und 1en und ganz ganz wenigen NA. Die Spalten tragen Item-Namen, und die Zeilen die Probandennamen, hier: idS



implodeRaschMatrix4Quality <- function(RaschMatrixSkeletonFilled, MissingToleranz = 0.10){
  ## nur die Sessions, die ausreichend viele richtig erkannte Items hat
  nItems <- ncol(RaschMatrixSkeletonFilled)
  AnzahlErkannterItems <- nItems-apply(is.na(RaschMatrixSkeletonFilled), 1, sum)
  RaschMatrixQualitaet <- RaschMatrixSkeletonFilled[AnzahlErkannterItems>=(1-MissingToleranz)*nItems,]
  return(RaschMatrixQualitaet)
}
