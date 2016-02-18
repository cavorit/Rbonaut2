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

  # Zwischen A und B gibt es immer zwei Winkel
  # Ich möchte den Winkel, der von A gegen den Uhrzeigersinn zu B führt.
  if (Aground == Bground){
    Erg <- 0
  }

  if (Bground > Aground){
    Erg <- (Bground-Aground)*5
  }

  if (Aground > Bground){
    Erg <- (playedAngle(Aground, 72) + Bground ) * 5
  }

  # Falls der Winkel größer als 180 Grad ist, will ich den Gegenwinkel mit negativem Vorzeichen zurückgeben
  if (Erg > 180){
    Erg <- (-1)*(360-Erg)
  }

  return(Erg)

}

adrA = 18
adrB = 10
playedAngle(adrA, adrB)
