#' @author Harald Fiedler
#' @description Liefert live die ItemID eines Balls
#' @details Liefert die ItemID eines Balls/Stimulus zurück für eine REST-Anfrage des simFBN
#' @param adrW numeric
#' @param adrB numeric
#' @return charactger der Länge 1, z.B. c("BL03")
#' @title detectItemIDLive

detectItemIDLive <- function(adrB, adrW){ # adrB = c(10, 10, 28); adrW = c(22, 62, 21)#22)
  DF <- data.frame(ItemID = c("BL01", "BL02", "BL03", "BL04", "BL05", "BL06", "BL07", "BL08", "BL09", paste0("BL", 10:32)),
                   adrM = c(64L, 28L, 10L, 46L, 64L, 28L, 10L, 46L, 64L, 46L, 10L, 64L, 10L, 64L, 46L, 28L, 64L, 10L, 10L, 46L, 64L, 46L, 28L, 46L, 28L, 64L, 28L, 10L, 28L, 64L, 10L, 28L),
                   adrW = c(68L, 72L, 22L, 36L, 54L, 66L, 4L, 18L, 70L, 52L, 58L, 40L, 8L, 32L, 14L, 12L, 30L, 24L, 48L, 34L, 26L, 38L, 60L, 6L, 44L, 42L, 16L, 2L, 50L, 56L, 62L, 20L)
  )


  Ergebnis <- c()

  for (h in 1:length(adrB)){
    if (is.element(adrW[h], DF[DF$adrM == adrB[h], "adrW"]  )){
      Ergebnis <- c(Ergebnis, unique(as.character(DF[DF$adrM == adrB[h] & DF$adrW == adrW[h], "ItemID"])))
    }else{
      Ergebnis <- c(Ergebnis, "unbekannt")
    }
  }

  return(Ergebnis)
}


