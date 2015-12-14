#' @author Harald Fiedler
#' @details Gibt den Winkel zwischen zwei FBN-Adressen
#' @description Winkel zwischen zwei Adressen
#' @param A numeric Adressen der Ausgangsfelder
#' @param B numeric Adressen der Zielfelder
#' @param Clockwise boolean der angibt, ob die Winkel im Uhrzeigersinn oder im mathematisch positiven Sinn gemessen werden. Default ist der mathematisch positive Sinn.
#' @return numeric mit Winkel aus 0:180
#' @title playedAngle
#' @examples
#' adrA=10
#' adrB=18
#' plotFBN()
#' playedAngle(adrA=adrA, adrB=adrB, Clockwise = FALSE)

playedAngle <- function(adrA, adrB, Clockwise = FALSE){
  if(any(adrA>72) | any(adrA<1) | any(adrB>72) | any(adrB<1)){stop("Adressen des FBN sind in 1:72")}

  Aground <- adrA+adrA%%2
  Bground <- adrB+adrB%%2

  Erg <- ( Bground - Aground ) * 5 * (-1)**Clockwise
  return(Erg)

}

