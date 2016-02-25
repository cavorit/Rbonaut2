#' @author Harald Fiedler
#' @title augmentRAW
#' @description data.frame SQL wird angereichert
#' @details Es werden Derivate gebildet und Punktzahlen eingebunden
#' @param SQL data.frame, dass per askDB() oder readRAW() eingelesen wurde
#' @return data.frame

augmentRAW <- function(SQL){

  message("\nErstelle Schlüßel")
  BALL <- data.frame(
    keyB = SQL$keyb,
    keyS = SQL$keys,
    keyP = SQL$keyp,
    keyT = SQL$keyt,
    idX = SQL$idx,
    idFBN = SQL$fbn,
    timestampS = SQL$sessiontimestamp,
    timestampB = SQL$balltimestamp
  )
  message("... erstellt")

  message("\nErstelle Biographie")
  BALL$PbnName <- SQL$spielername
  BALL$PbnNachname <- getNachname(SQL$spielername)
  BALL$PbnVorname <- getVorname(SQL$spielername)
  BALL$PbnGeboren <- SQL$geburtstag
  BALL$PbnAlter <- SQL$alter
  BALL$PbnPosition <- SQL$pos
  BALL$PbnTeam <- SQL$team
  message("... erstellt")

  message("\nErstelle itemdefinierende Variablen")
  BALL$adrM <- as.integer(SQL$adrm)
  BALL$adrW <- as.integer(getFirstAdrW(SQL$adrw))
  BALL$isMultiTarg <- isMultiTarget(SQL$adrw)
  BALL$MultiTarg <- SQL$adrw
  BALL$sL <- SQL$sl
  BALL$sR <- SQL$sr
  BALL$vA <- SQL$va
  BALL$AW <- playedAngle(SQL$adrm, getFirstAdrW(SQL$adrw)) # Aktionswinkel
  BALL$AWcg <- SQL$cgoalwinkel
  BALL$HW <- getHW(SQL=SQL) # Höhenwinkel
  BALL$RW <- NA # Reaktionswinkel wird später ermittelt
  message("... erstellt")

#   message("\nErstelle technische misc")
#   BALL$DELAY <- SQL$delay
#   BALL$LED <- "t"
#   BALL$SND <- "t"
#   message("... erstellt")

  message("\nErstelle Item-Response")
  BALL$adrOut <- SQL$hit
  BALL$FBq <- SQL$goal
  BALL$FBt <- SQL$time
  BALL$CGoalScore <- SQL$score
  message("... erstellt")

  message("\nErstelle Sonstiges")
  BALL$goalUnder5000ms <- as.numeric(SQL$hit == getFirstAdrW(SQL$adrw) & SQL$time < 5000)
  #BALL$Date = as.Date(SQL$date)
  #BALL$JSONfile = NA
  message("... erstellt")

  message("\nErstelle nB")
  SQL2DF.nB <- function(SQL, BALL){
    DT <- data.table(BALL)
    DT.nB <- DT[, .(nB=max(idX)),by=idS]
    BALL <- merge(BALL, DT.nB, all.x=TRUE)
    return(BALL)
  }
  BALL <- SQL2DF.nB(SQL=SQL, BALL=BALL)
  BALL$nB <- BALL$nB+1
  message("... erstellt.")

  message("\nErstelle Reaktionswinkel")
  SQL2DF.RW <- function(SQL, BALL){

    # add Reaktionswinkel

    iCalcReaktionsWinkel <- function(eineSESSION){
      DT <- data.table(eineSESSION)
      setkey(DT, idX)
      DT$adrLast <- c(NA, DT$adrW)[1:(nrow(DT))]
      #DT$RW[2:nrow(DT)] <- Rbonaut::played_angle(DT$adrLast[2:nrow(DT)], DT$adrM[2:nrow(DT)])
      if (nrow(DT) == 1){DT$RW <- NA}else{DT$RW[2:nrow(DT)] <- Rbonaut2::playedAngle(DT$adrLast[2:nrow(DT)], DT$adrM[2:nrow(DT)])}
      DF <- as.data.frame(DT)
      rm(DT)
      return(DF)
    }
    # eineSESSION <- BALL[BALL$idS=="FBN-Hoffenheim-2015-08-27-18:59:25" , c(2, 4, 10, 11, 3, 30)]

    DF <- NULL
    for (s in unique(BALL$idS)){ #s <- unique(BALL$idS)[73] # zu Testzwecken
      eineSESSION <- BALL[BALL$idS==s,]
#       print("====== Ich analysiere nun: ")
#       print(eineSESSION[, c(2, 4, 10, 11, 3, 30)])
#       print("---")
      DF <- rbind(DF, iCalcReaktionsWinkel(eineSESSION=eineSESSION))
    }

    BALL <- DF
    return(BALL)
  }
  BALL <- SQL2DF.RW(BALL=BALL, SQL=SQL)
  message("... fertig")

  message("\nErstelle ItemID")
  SQL2DF.detectItemID <- function(BALL){
    ItemID <- NULL
    for (i in 1:nrow(BALL)){
      Stimulus <- BALL[i, ]
      ItemID <- c(ItemID, detectItemID(Stimulus=Stimulus))
    }
  BALL$ItemID <- ItemID
  return(BALL)
  }
  BALL <- SQL2DF.detectItemID(BALL=BALL)

  message("... fertig")

  message("\nErstelle ItemResponse")
  SQL2DF.detectItemResponse <- function(BALL){
    BALL <- detectItemResponse(Stimulus=BALL)
    return(BALL)
  }
  BALL <- SQL2DF.detectItemResponse(BALL=BALL)
  message("... fertig")

#   message("\nSortiere Spalten")
#   SQL2DF.rename <- function(BALL){
#     BALL <- BALL[c("idFBN", "idS", "idB", "idX", "nB", "ItemID", "ItemResponse",
#                    "PbnName", "PbnNachname", "PbnVorname", "PbnPosition", "PbnTeam",
#                    "adrM", "adrW", "adrLast", "adrOut",
#                    "sL", "sR", "vA",
#                    "isMultiTarg", "MultiTargs",
#                    "RW", "HW", "AW",
#                    "DELAY", "SND", "LED", "Date", "JSONfile", "Comments", "goal.under.5000ms",
#                    "FBq", "FBt", "Fiedler2012")]
#     return(BALL)
#   }
#   BALL <- SQL2DF.rename(BALL=BALL)
#   message("... fertig")

  return(BALL)
}




