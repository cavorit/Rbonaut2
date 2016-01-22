#' @author Harald Fiedler
#' @title SQL2DF
#' @description SQL zu data.frame
#' @details Mit shinySQL erhalten wir von CGoal SQL-Abfragen händisch als .csv-Files zurück. Diese werden in ein data.frame umgewandelt
#' @param SQL data.frame, dass per read.csv eingelesen wurde
#' @return data.frame
#' @examples
#' message("Ich lade den R-Paket-internen RAW-Datensatz: Footbonaut_Datenabfrage_RicoWehrle.csv")
#' Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
#' SQL <- read.csv2(file=Pfad, sep = ",", stringsAsFactors = FALSE, encoding = "utf8")
#' DF <- SQL2DF(SQL=SQL)
#' head(DF)

SQL2DF <- function(SQL){

  message("\nErstelle Schlüßel")
  SQL2DF.key <- function(SQL){
    BALL <- data.frame(
      idB = paste(paste0(paste(SQL$fbn, sep="-", as.character(as.Date(SQL$date))),
                         paste0("-", getSessionTimeStamp(SQL$date))), gibZahlFuehrendeNullen(SQL$idx), sep="-B"),
#       idB = paste(paste0(paste(SQL$fbn, sep="-", as.character(as.Date(SQL$date))),
#                          paste0("-", getSessionTimeStamp(SQL$date))), SQL$idx, sep="-B"),
      idS = paste0(paste(SQL$fbn, sep="-", as.character(as.Date(SQL$date))),
                   paste0("-", getSessionTimeStamp(SQL$date))),
      idX = SQL$idx,
      idFBN = SQL$fbn
    )
    return(BALL)
  }
  BALL <- SQL2DF.key(SQL=SQL)
  message("... erstellt")

  message("\nErstelle Biographie (= nichtintegres bzw. weiches idP)")
  SQL2DF.bio <- function(SQL, BALL){
    BALL$PbnName <- SQL$spielername
    BALL$PbnNachname <- getNachname(SQL$spielername)
    BALL$PbnVorname <- getVorname(SQL$spielername)
    BALL$PbnPosition <- SQL$pos
    BALL$PbnTeam <- SQL$team
    return(BALL)
  }
  BALL <- SQL2DF.bio(SQL=SQL, BALL=BALL)
  message("... erstellt")

  message("\nErstelle itemdefinierende Variablen")
  SQL2DF.itemDefinition <- function(SQL, BALL){
    BALL$adrM <- as.integer(SQL$adrm)
    BALL$adrW <- as.integer(getFirstAdrW(SQL$adrw))
    BALL$isMultiTarg <- isMultiTarget(SQL$adrw)
    BALL$MultiTargs <- SQL$adrw
    BALL$sL <- SQL$sl
    BALL$sR <- SQL$sr
    BALL$vA <- SQL$va
    #BALL$AW <- Rbonaut::played_angle(SQL$adrm, getFirstAdrW(SQL$adrw)) # Aktionswinkel
    BALL$AW <- playedAngle(SQL$adrm, getFirstAdrW(SQL$adrw)) # Aktionswinkel
    BALL$HW <- getHW(SQL=SQL) # Höhenwinkel
    BALL$RW <- NA # Reaktionswinkel
    return(BALL)
  }
  BALL <- SQL2DF.itemDefinition(SQL=SQL, BALL=BALL)
  message("... erstellt")

  message("\nErstelle technische misc")
  SQL2DF.misc <- function(SQL, BALL){
    BALL$DELAY <- SQL$delay
    BALL$LED <- "t"
    BALL$SND <- "t"
    return(BALL)
  }
  BALL <- SQL2DF.misc(SQL=SQL, BALL=BALL)
  message("... erstellt")

  message("\nErstelle Item-Response")
  SQL2DF.itemResponse <- function(SQL, BALL){
    BALL$adrOut <- SQL$hit
    BALL$FBq <- SQL$goal
    BALL$FBt <- SQL$time
    BALL$Fiedler2012 <- SQL$score
    return(BALL)
  }
  BALL <- SQL2DF.itemResponse(SQL=SQL, BALL=BALL)
  message("... erstellt")

  message("\nErstelle Sonstiges")
  SQL2DF.sonstiges <- function(SQL, BALL){
    BALL$goal.under.5000ms <- as.numeric(SQL$hit == getFirstAdrW(SQL$adrw) & SQL$time < 5000)
    BALL$Date = as.Date(SQL$date)
    BALL$JSONfile = NA
    BALL$Comments = NA
    return(BALL)
  }
  BALL <- SQL2DF.sonstiges(SQL=SQL, BALL=BALL)
  message("... erstellt")

  message("\nErstelle nB")
  SQL2DF.nB <- function(SQL, BALL){
    DT <- data.table(BALL)
    DT.nB <- DT[, .(nB=max(idX)),by=idS]
    BALL <- merge(BALL, DT.nB, all.x=TRUE)
    return(BALL)
  }
  BALL <- SQL2DF.nB(SQL=SQL, BALL=BALL)
  message("... erstellt. Anmerkung: nB = max(idX), daher ist nB+1 die tatsächliche Anzahl der Bälle")

  message("\nErstelle Reaktionswinkel")
  SQL2DF.RW <- function(SQL, BALL){

    # add Reaktionswinkel

    iCalcReaktionsWinkel <- function(eineSESSION){
      DT <- data.table(eineSESSION)
      setkey(DT, idX)
      DT$adrLast <- c(NA, DT$adrW)[1:(nrow(DT))]
      DT
      DT$RW[2:nrow(DT)] <- Rbonaut::played_angle(DT$adrLast[2:nrow(DT)], DT$adrM[2:nrow(DT)])
      DF <- as.data.frame(DT)
      rm(DT)
      return(DF)
    }
    # eineSESSION <- BALL[BALL$idS=="FBN-Hoffenheim-2015-08-27-18:59:25" , c(2, 4, 10, 11, 3, 30)]

    DF <- NULL
    for (s in unique(BALL$idS)){
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
  BALL <- SQL2DF.detectItemResponse(Stimulus=BALL)
  message("... fertig")

  message("\nSortiere Spalten")
  SQL2DF.rename <- function(BALL){
    BALL <- BALL[c("idB", "idS", "idFBN", "idX", "nB", "ItemID", "ItemResponse",
                   "PbnName", "PbnNachname", "PbnVorname", "PbnPosition", "PbnTeam",
                   "adrM", "adrW", "adrLast", "adrOut",
                   "sL", "sR", "vA",
                   "isMultiTarg", "MultiTargs",
                   "RW", "HW", "AW",
                   "DELAY", "SND", "LED", "Date", "JSONfile", "Comments", "goal.under.5000ms",
                   "FBq", "FBt", "Fiedler2012")]
    return(BALL)
  }
  BALL <- SQL2DF.rename(BALL=BALL)
  message("... fertig")

  return(BALL)
}




