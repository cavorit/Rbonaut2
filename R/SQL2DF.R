#' @author Harald Fiedler
#' @title SQL2DF
#' @description SQL zu data.frame
#' @details Mit shinySQL erhalten wir von CGoal SQL-Abfragen händisch als .csv-Files zurück. Diese werden in ein data.frame umgewandelt
#' @param SQL data.frame, dass per ein read.csv eingelesen wurde
#' @return data.frame

SQL2DF <- function(SQL){
  
  message("\nErstelle Schlüßel")
  SQL2DF.key <- function(SQL){
    BALL <- data.frame(
      idB = paste(paste0(paste(SQL$fbn, sep="-", as.character(as.Date(SQL$date))), 
                         paste0("-", getSessionTimeStamp(SQL$date))), SQL$idx, sep="-B"),
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
    BALL$Name <- SQL$spielername
    BALL$Nachname <- getNachname(SQL$spielername)
    BALL$Vorname <- getVorname(SQL$spielername)
    BALL$Position <- SQL$pos
    BALL$team <- SQL$team
    return(BALL)
  }
  BALL <- SQL2DF.bio(SQL=SQL, BALL=BALL)
  message("... erstellt")
  
  message("\nErstelle itemdefinierende Variablen")
  SQL2DF.itemDefinition <- function(SQL, BALL){
    BALL$adrM <- SQL$adrm
    BALL$adrW <- getFirstAdrW(SQL$adrw)
    BALL$isMultiTarget <- isMultiTarget(SQL$adrw)
    BALL$MultiTarg <- SQL$adrw
    BALL$sL <- SQL$sl
    BALL$sR <- SQL$sr
    BALL$vA <- SQL$va
    BALL$AW <- Rbonaut::played_angle(SQL$adrm, getFirstAdrW(SQL$adrw)) # Aktionswinkel
    BALL$RW <- NA # Reaktionswinkel
    return(BALL)
  }
  BALL <- SQL2DF.itemDefinition(SQL=SQL, BALL=BALL)
  message("... erstellt")
  
  message("\nErstelle technische misc")
  SQL2DF.misc <- function(SQL, BALL){
    BALL$Delay <- SQL$delay
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
    BALL$date = as.Date(SQL$date)
    BALL$JSONfile = NA
    BALL$comments = NA 
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
  message("... erstellt")
  
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
  
  return(BALL)
}   
  

#     
# SQL <- read.csv2("../RAW/Footbonaut_Datenabfrage_RicoWehrle.csv", header = TRUE, 
#                  sep=",", stringsAsFactors = FALSE, encoding = "utf8")
# 
# library(data.table)
# library(Rbonaut)
# source(file = "istFormatNachnameKommeVorname.R")
# source(file = "getVorname.R" )
# source(file = "getNachname.R")
# source(file="getAdrWAlsListe.R")
# source(file="isMultiTarget.R")
# source(file="getFirstAdrW.R")
# source(file="getSessionTimeStamp.R")   
# 
# X <- SQL2DF(SQL)
# View(X)
    
