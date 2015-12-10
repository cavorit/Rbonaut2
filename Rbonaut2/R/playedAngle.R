#' @author Harald Fiedler
#' @details Gibt den Winkel zwischen zwei FBN-Adressen
#' @description Winkel zwischen zwei Adressen
#' @param A numeric Adressen der Ausgangsfelder
#' @param B numeric Adressen der Zielfelder
#' @param Clockwise boolean der angibt, ob die Winkel im Uhrzeigersinn oder im mathematisch positiven Sinn gemessen werden. Default ist der mathematisch positive Sinn.
#' @return numeric mit Winkel aus 0:180


playedAngle <- function(adrA, adrB){
  if(any(adrA>72) | any(adrA<1) | any(adrB>72) | any(adrB<1)){stop("Adressen des FBN sind in 1:72")}

  addiereImRing <- function (a, b){
    if (a <= 0 | b <= 0)
      warning("a und b sollten positiv sein. Nutze subtrahiereImRing() statt dessen.")
    if (a == 72 & b == 72) {
      return(72)
    }
    else {
      return((a + b)%%72)
    }
  }

  subtrahiereImRing <- function (a, b)
  {
    if (a <= 0 | b <= 0)
      warning("a und b sollten positiv sein")
    if (a > b)
      return(a - b)
    if (a == b)
      return(0)
    if (a < b)
      return(a - b + 72)
  }

  LotAdrA <- adrA+adrA%%2
  LotAdrB <- adrB+adrB%%2

  Erg <- (subtrahiereImRing(a=LotAdrA, b=LotAdrB)) * 10
  return(Erg)
}


playedAngle(adrA=70, adrB=71)
