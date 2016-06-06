#' @author Harald Fiedler
#' @description Gibt Informationen an simFBN() zurück, wie der nächste Ball gespielt werden soll
#' @details Für eine genauere Beschreibung verweise ich auf das Markdown-Manual für BL32MultiTargetSimTest.md. Diese Funktion erstellt den Knoten "nextB"
#' @title itemID2Params
#' @param ItemID charakter der Länge 1, welches den Namen des Items angibt. Implementiert sind BL01:BL32
#' @return list
#' @examples itemID2Params("BL03")


itemID2Params <- function(ItemID){ # ItemID = "BL04"

  if ( !is.element(ItemID, c("BL01", "BL02", "BL03", "BL04", "BL05", "BL06", "BL07", "BL08", "BL09", paste0("BL", 10:32)))){
    stop("Es wurde eine ItemID übergeben, die mir unbekannt ist")
  }

  DF <- data.frame(ItemID = c("BL01", "BL02", "BL03", "BL04", "BL05", "BL06", "BL07", "BL08", "BL09", paste0("BL", 10:32)),
                   adrM = c(64L, 28L, 10L, 46L, 64L, 28L, 10L, 46L, 64L, 46L, 10L, 64L, 10L, 64L, 46L, 28L, 64L, 10L, 10L, 46L, 64L, 46L, 28L, 46L, 28L, 64L, 28L, 10L, 28L, 64L, 10L, 28L),
                   adrW = c(68L, 72L, 22L, 36L, 54L, 66L, 4L, 18L, 70L, 52L, 58L, 40L, 8L, 32L, 14L, 12L, 30L, 24L, 48L, 34L, 26L, 38L, 60L, 6L, 44L, 42L, 16L, 2L, 50L, 56L, 62L, 20L)
  )

  ItemParams <- DF[ItemID == DF$ItemID, ]

  nextB <- list(
    adrB = ItemParams$adrM,
    sLsRvA = c(50, 60, 4),
    adrW = ItemParams$adrW,
    adrCol = c("##FF8800"),
    colorExpiration = 2195
  )

  return(nextB)
}



