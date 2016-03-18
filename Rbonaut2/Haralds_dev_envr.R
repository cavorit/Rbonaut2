rm(list=ls())
library(Rbonaut2)
# DB muss erst von Hand gestartet werden.

# WievielterMonat = 2
#
Monate <- c("2013-12",
            "2014-01", "2014-02", "2014-03", "2014-04",
            "2014-05", "2014-06", "2014-07", "2014-08",
            "2014-09", "2014-10", "2014-11", "2014-12",
            "2015-01", "2015-02", "2015-03", "2015-04",
            "2015-05","2015-06", "2015-07",  "2015-08",
            "2015-09", "2015-10", "2015-11","2015-12",
            "2016-01")
LetzterTag <- c(31,
               rep(c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31), times=2),
               31)

# Anfangsdatum  = paste0(Monate, "-01")[WievielterMonat]  #"2013-12-01"
# Enddatum      = paste(Monate, LetzterTag, sep = "-")[WievielterMonat]  #"2013-12-31"
# Dateiname     = paste0("RAW", Monate)[WievielterMonat] #    "RAW2013-12"

########### SCHRITT 1: Hole SQL-Query
for (WievielterMonat in 1:26){
  Anfangsdatum  = paste0(Monate, "-01")[WievielterMonat]  #"2013-12-01"
  Enddatum      = paste(Monate, LetzterTag, sep = "-")[WievielterMonat]  #"2013-12-31"
  Dateiname     = paste0("RAW", Monate)[WievielterMonat] #    "RAW2013-12"
  SQL <- askDB(Anfangsdatum = Anfangsdatum, Enddatum = Enddatum)
  writeRAW(SQL = SQL, Dateiname = Dateiname)
}

########### SCHRITT 2: augmentRAW
for (WievielterMonat in 1:26){
  Anfangsdatum  = paste0(Monate, "-01")[WievielterMonat]  #"2013-12-01"
  Enddatum      = paste(Monate, LetzterTag, sep = "-")[WievielterMonat]  #"2013-12-31"
  Dateiname     = paste0("RAW", Monate)[WievielterMonat] #    "RAW2013-12"
  readRAW(Dateiname = Dateiname)
  DF <- augmentRAW(SQL = SQL)
  writeAUGMENTED(DF=DF, Dateiname= paste0("AUGMENTED", Monate[WievielterMonat]) ) # AUGMENTED2014-01
  table(DF$ItemID)
}
system('say "Iche habe fertig." -v Alice')

########### SCHRITT 3: readAUGMENTED
DFtotal <- NULL
for (WievielterMonat in 1:26){
  Anfangsdatum  = paste0(Monate, "-01")[WievielterMonat]  #"2013-12-01"
  Enddatum      = paste(Monate, LetzterTag, sep = "-")[WievielterMonat]  #"2013-12-31"
  Dateiname     = paste0("AUGMENTED", Monate)[WievielterMonat] #    "RAW2013-12"
  readAUGMENTED(Dateiname = Dateiname)
  DFtotal <- rbind(DF, DFtotal)
  print(Dateiname)
  print(table(DF$ItemID))
  print(dim(DF))
}
DF <- DFtotal

# library(data.table)
# DT <- data.table(DF)
# X <- DT[, .("Name"=unique(PbnName), "Beginn"=unique(timestampS), "ErkannteItems"= sum(ItemID!="unbekannt")), by=.("ID"=keyS)]
# write.csv2(x = X, file = "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/JanSpielmann/IndexAllerSessions.csv", fileEncoding = "utf8")

########### erstelle eine neue ItemBank

  ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))
  RMtotal <- NULL

  for (WievielterMonat in 1:26){
    readAUGMENTED(Dateiname = paste0("AUGMENTED", Monate[WievielterMonat]) )

    adrW <- DF$adrW
    adrOut <- DF$adrOut
    FBt <- DF$FBt
    ItemID <- DF$ItemID
    DF$ItemResponse <- 0
    DF[ItemID=="BL01" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL02" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL03" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL04" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL05" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL06" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL07" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL08" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL09" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL10" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL11" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL12" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL13" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL14" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL15" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL16" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL17" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL18" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL19" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL20" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL21" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL22" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL23" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL24" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL25" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL26" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL27" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL28" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL29" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL30" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL31" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1
    DF[ItemID=="BL32" & FBt < 2195 & adrW == adrOut, "ItemResponse"] <- 1


      RaschMatrixSkeleton <- erstelleRaschMatrixSkeleton(DF=DF, ItemIDNamen = ItemIDNamen)
      RaschMatrixSkeletonFilled <- fillRaschMatrixSkeleton(DF=DF, RaschMatrixSkeleton = RaschMatrixSkeleton)
      RaschMatrixSkeletonFilledAndImploded4Quality <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled)
      RM <- RaschMatrixSkeletonFilledAndImploded4Quality

      ## Füge das Alter hinzu
      RM <- as.data.frame(RM)
      RM <- cbind(RM, DF[is.element(DF$keyS,rownames(RM)) & DF$idX == 0, c("PbnJahre", "PbnTeam", "PbnPosition", "keyS")])
      head(RM)
      # RM$keyS == rownames(RM) # TRUE

      #if (!any(is.element(ls(), "RMtotal"))){RMtotal <- NULL}
      RMtotal <- rbind(RMtotal, RM)
    }
  system('say "Iche habe fertig." -v Alice')
  RM <- RMtotal
  set.seed(124)
  Explorativ <- !(!sample(0:1, size=nrow(RM), replace=TRUE)) # !! wandelt 0-1 in FALSE-TRUE
  Konfirmatorisch <- !Explorativ

  ## Rasch-Analyse
  # Modellbasierte rekursive Partitionierung {psychotree}
  library(psychotree)
  # DichotomisierteCovariate <- model.matrix( ~ PbnTeam - 1, data=RM)
  fit2 <- raschtree(as.matrix(RM[, ItemIDNamen]) ~ RM$PbnJahre[] , verbose=TRUE)
  #pdf(file = "rekursivePartitionierung.pdf")
  plot(fit2)
  #dev.off()

  ## Rasch-Analyse für Jahre < 26.225 Jahre
  library(eRm)
  fit <- RM(RM[RM$PbnJahre < 26.225  , ItemIDNamen])
  summary(fit)
  fit$betapar
  data.frame(
    Schwierigkeitsparameter = c("BL01"=0, fit$etapar),
    Randsumme = colSums(RM[RM$PbnJahre < 26.225  , ItemIDNamen], na.rm = TRUE)
  )
  ## Modellgeltungstest
  test <- LRtest(fit, splitcr="mean", se=TRUE)
  par(mfrow=c(2,2))
  plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.99, col=1), main="BL01:BL08", beta.subset = 0:7)
  plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.99, col=1), main="BL09:BL16", beta.subset = 8:15)
  plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.99, col=1), main="BL17:BL24", beta.subset = 16:23)
  plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.99, col=1), main="BL25:BL32", beta.subset = 24:32)



#### catR

library(catR)
Bank <- readItemBank()
EineSession <- DF[DF$keyS == "56764750-1ae2-465e-add2-f0738f53692c"  ,] # Jan Gutzeit (*2003) Session vom 2015-04-30 17:44:24
EineSession

Fiedler2016 <- NULL
for (b in 1:32){ # b = 2
  Historie <- EineSession[1:b,]
  tmp <- catR::thetaEst(it = Bank[1:b,-1], x = Historie$ItemResponse) # Achtung: Bei Bank müssen im Falle von Adaptivität die Zeilen entsprechend der Testung umsortiert werden.
  Fiedler2016 <- c(Fiedler2016, tmp)
}
plot(1:32, Fiedler2016, type = 'o', ylim=c(-4,4), main="Jan Gutzeit (*2003) \n Session #1 vom 30. Apr. 2015 17:44:24", xlab="Ball Nummer")
abline(h=Fiedler2016[32])
Sigma <- catR::semTheta(thEst = Fiedler2016[32], it = Bank[, -1], x=EineSession$ItemResponse)
abline(h=Fiedler2016[32]+Sigma, col=2)
abline(h=Fiedler2016[32]-Sigma, col=2)
abline(v=16, col="magenta")
