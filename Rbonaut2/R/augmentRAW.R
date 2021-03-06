#' @author Harald Fiedler
#' @title augmentRAW
#' @description data.frame SQL wird angereichert
#' @details Es werden Derivate gebildet und Punktzahlen eingebunden. Problemhafte Sessions werden eliminiert. Dazu zählen zwei Sessions aus dem November 2014 ohne adrW.
#' @param SQL data.frame, dass per askDB() oder readRAW() eingelesen wurde
#' @return data.frame

augmentRAW <- function(SQL){

  ProblemSessions <- c("a715dff9-d9a1-4aaa-b922-b15f52be1d49", # eine Session aus dem November 2014 ohne Zielfelder
                       "a715dff9-d9a1-4aaa-b922-b15f52be1d49") # eine Session aus dem Novmeber 2014, ebenfalls ohne Zielfelder

  if(any(is.element(SQL$keys, ProblemSessions))){
    warning("ProblemSessions identifiziert und eliminiert.Details siehe Dokumentation augmentRAW()")
    SQL <- SQL[!is.element(SQL$keys, ProblemSessions), ]
  }

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
  BALL$PbnJahre <- as.numeric( (as.Date(SQL$sessiontimestamp) - as.Date(SQL$geburtstag)) / 365)
  BALL$PbnPosition <- SQL$pos
  BALL$PbnTeam <- SQL$team
  message("... erstellt")

  message("\nErstelle itemdefinierende Variablen")
  BALL$adrM <- as.integer(SQL$adrm)
  BALL$adrW <- as.integer(getFirstAdrW(SQL$adrw))
  BALL$isMultiTarg <- isMultiTarget(SQL$adrw)
  BALL$adrWW <- SQL$adrw
  BALL$adrDD <- SQL$adrd

  BALL$sL <- SQL$sl
  BALL$sR <- SQL$sr
  BALL$vA <- SQL$va
  BALL$AW <- playedAngle(SQL$adrm, getFirstAdrW(SQL$adrw)) # Aktionswinkel
  BALL$AWcg <- SQL$cgoalwinkel
  BALL$HW <- getHW(SQL=SQL) # Höhenwinkel
  BALL$RW <- NA # Reaktionswinkel wird später ermittelt
  message("... erstellt")

#   message("\nErstelle technische misc")
    BALL$DELAY <- SQL$delay
#   BALL$LED <- "t"
#   BALL$SND <- "t"
#   message("... erstellt")

  message("\nErstelle Item-Response")
  BALL$adrOut <- SQL$hit
  BALL$FBq <- SQL$goal
  BALL$FBt <- SQL$time
  BALL$CGoalScore <- SQL$score

  Term01 <- 1218.250 * exp(-(BALL$FBt/1000))
  Term02 <- 100 * exp(1/50 * BALL$FBq - 2)
  maximalerWalzenSpeed <- (apply(data.frame(BALL$sL, BALL$sR), 1, max))
  Term03 <- (2^( maximalerWalzenSpeed / 100 ) ) + 3^((1000-BALL$DELAY)/(1000)) + 2^(BALL$vA/20)
  Term04 <- exp( (log(4)/360 )*(playedAngle(adrA = BALL$adrM, adrB = BALL$adrW)/40))
  BALL$Fiedler2012 <- 1.006693 * (exp(5))/(1+exp(5)) * Term01 * Term02 * Term03 * Term04

  message("... erstellt")

  message("\nErstelle Sonstiges")
  BALL$goalUnder5000ms <- as.numeric(SQL$hit == getFirstAdrW(SQL$adrw) & SQL$time < 5000)
  #BALL$Date = as.Date(SQL$date)
  #BALL$JSONfile = NA
  message("... erstellt")

  message("\nErstelle nB")
  SQL2DF.nB <- function(SQL, BALL){
    DT <- data.table(BALL)
    DT.nB <- DT[, .(nB=max(idX)),by=keyS]
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
    # eineSESSION <- BALL[BALL$keyS=="002b6573-cf12-436d-bccd-0856b0bb0a25" , ] # Session aus JAN 2016

    DF <- NULL
    for (s in unique(BALL$keyS)){ #s <- unique(BALL$keyS)[73] # zu Testzwecken
      eineSESSION <- BALL[BALL$keyS==s,]
#       print("====== Ich analysiere nun: ")
#       print(eineSESSION[, c(2, 4, 10, 11, 3, 30)])
#       print("---")
      DF <- rbind(DF, iCalcReaktionsWinkel(eineSESSION=eineSESSION))
    }
    return(DF)
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

  BALLaugm <- NULL
  for (S in unique(BALL$keyS)){#################################### Fiedler2016a : S <- unique(BALL$keyS)[3]
    cat("Ich analysiere jetzt Session ", as.character(S), "\n")
    EineSession <- BALL[BALL$keyS==S, ]
    #print(calcFiedler2016a(SessionDF = EineSession))
    BALLaugm <- rbind(BALLaugm, calcFiedler2016a(SessionDF = EineSession))
  }
  BALL <- BALLaugm


  message("\nSortiere Spalten")
  SQL2DF.rename <- function(BALL){
    BALL <- BALL[c("keyS", "keyB", "keyP", "keyT", "idFBN", "timestampS", "timestampB",
                   "idX", "nB",
                   "ItemID", "ItemResponse",
                   "PbnName", "PbnNachname", "PbnVorname", "PbnGeboren", "PbnAlter", "PbnJahre", "PbnPosition", "PbnTeam",
                   "adrM", "adrW", "isMultiTarg", "adrWW", "adrDD", "adrLast", "adrOut",
                   "sL", "sR", "vA",
                   "RW", "HW", "AW", "AWcg",
                   "DELAY", "goalUnder5000ms",
                   "FBq", "FBt", "CGoalScore", "Fiedler2012", "Fiedler2016a")]
    return(BALL)
  }
  BALL <- SQL2DF.rename(BALL=BALL)
  message("... fertig")

  return(BALL)
}




