#' @author Harald Fiedler
#' @description Berechnet für eine einzelne Session (DF) theta-Hat nach jedem Ball
#' @details DF darf nur eine Session beinhalten, und es wird davon ausgegangen, dass DF chronologisch sortiert ist. Dann berechnet die Funktion thetaHat nach jedem Ball und stellt dies am Ende in der Spalte Fiedler2016a zur Verfügung.
#' @param SessionDF data.frame mit einer Session
#' @param ItemBank die ItemBank, wird per default mittels readItemBank() eingelesen.
#' @return data.frame, dass mit DF identisch ist, aber um eine Spalte Fiedler2016a erweitert wurde.
#' @name calcFiedler2016a



calcFiedler2016a <- function(SessionDF, ItemBank=readItemBank()){ # SessionDF = EineSession
  # Achtung, die Berechnung setzt implizit voraus, dass die Items in SessionDF eine chronologische Reihenfolge aufweisen.
  DF <- SessionDF
  DF$Fiedler2016a <- NA
  Fiedler2016a <- NULL
  # Eliminiere alle Items, die nicht zu den offiziellen BL32-Items gehören
  ItemNamenVonBL32 <- paste0("BL", gibZahlFuehrendeNullen(1:32, digits = 2))
  ItemKnown <- is.element(SessionDF$ItemID, ItemNamenVonBL32)
  SessionDF <- SessionDF[ItemKnown, ]

  for (b in 1:nrow(SessionDF)){ # b = 2
    Historie <- SessionDF[1:b,]
    tmp <- catR::thetaEst(it = Bank[1:b,-1], x = Historie$ItemResponse) # Achtung: Bei Bank müssen im Falle von Adaptivität die Zeilen entsprechend der Testung umsortiert werden.
    Fiedler2016a <- c(Fiedler2016a, tmp)
  }
  DF[ItemKnown, "Fiedler2016a"] <- Fiedler2016a
  return(DF)
}
