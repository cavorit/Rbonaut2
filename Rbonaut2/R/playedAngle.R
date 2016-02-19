#' @author Harald Fiedler
#' @details Gibt den Winkel zwischen zwei FBN-Adressen
#' @description Winkel zwischen zwei Adressen.
#' @param adrA numeric Adressen der Ausgangsfelder
#' @param adrB numeric Adressen der Zielfelder
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

  Erg <- rep(NA, times=length(adrA))

  # Zwischen A und B gibt es immer zwei Winkel
  # Ich möchte den Winkel, der von A gegen den Uhrzeigersinn zu B führt.
  Erg[Aground == Bground] <- 0
  Erg[Bground > Aground] <- (Bground[Bground > Aground] - Aground[Bground > Aground])*5

  #Erg[Aground > Bground] <- (playedAngle(Aground[Aground > Bground], 72) + Erg[Aground > Bground]$Bground ) * 5
  Erg[Aground > Bground] <- ( (72-Aground[Aground > Bground]) + Bground[Aground > Bground] ) *5

  # Falls der Winkel größer als 180 Grad ist, will ich den Gegenwinkel mit negativem Vorzeichen zurückgeben
  Erg[Erg > 180] <- (-1) * (360-Erg[Erg > 180])

  return(Erg)

}

#adrA = c(10, 12, 22)
#adrB = c(18, 13, 8)
#playedAngle(adrA, adrB)
