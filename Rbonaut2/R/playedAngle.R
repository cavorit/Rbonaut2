#' @author Harald Fiedler
#' @details Gibt den Winkel zwischen zwei FBN-Adressen
#' @description Winkel zwischen zwei Adressen. Die Funktion funktioniert *nicht* Vektorwertig
#' @param A numeric Adressen der Ausgangsfelder
#' @param B numeric Adressen der Zielfelder
#' @return numeric mit Winkel aus -170:180 wobei der Winkel positiv im Uhrzeigersinn gemessen wird
#' @title playedAngle
#' @examples
#' adrA=10
#' adrB=18
#' plotFBN()
#' playedAngle(adrA=adrA, adrB=adrB)

playedAngle <- function(adrA, adrB, Clockwise = FALSE){
  if(any(adrA>72) | any(adrA<1) | any(adrB>72) | any(adrB<1)){stop("Adressen des FBN müssen in 1:72 liegen")}

  Aground <- adrA+adrA%%2
  Bground <- adrB+adrB%%2

  if (Aground == Bground) return(0)
  if (Aground > Bground){
    Winkel <- (Aground-Bground)*5;
    Signum <- 1
  }
  if (Aground < Bground){
    Winkel <- (Bground-Aground)*5;
    Signum <- -1
  }

  if (Winkel > 180){
    Winkel <- Winkel-180
    Signum <- Signum * (-1)
  }

  Erg <- Winkel
  return(Erg)

}

