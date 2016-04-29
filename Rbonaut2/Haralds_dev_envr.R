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

  # Achtung: eRm::fit$eta == catR::ItemBank$beta bzw. eRm::fit$beta != catR::ItemBank$beta
  ItemSchwierigkeit <- fit$etapar
  par(mfrow=c(1,1))
  plot(1:32, c(0, ItemSchwierigkeit), main="Itemschwierigkeit BL32")
  hist(ItemSchwierigkeit)
  write.csv2(x = ItemSchwierigkeit, file="~/Desktop/ItemschwierigkeitBL32.csv")

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

#### Normtabellen erstellen

JanSpielmann <- read.csv(file="~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/JanSpielmann/IndexAllerSessions_Normgruppen.csv", header=TRUE, sep=";")
head(JanSpielmann)
NormSessions <- list(
  "Probanden" = JanSpielmann[!is.na(JanSpielmann$Probanden), "ID"],
  "U12" = JanSpielmann[!is.na(JanSpielmann$U12), "ID"],
  "U13" = JanSpielmann[!is.na(JanSpielmann$U13), "ID"],
  "U14" = JanSpielmann[!is.na(JanSpielmann$U14), "ID"],
  "U15" = JanSpielmann[!is.na(JanSpielmann$U15), "ID"],
  "U16" = JanSpielmann[!is.na(JanSpielmann$U16), "ID"],
  "U17" = JanSpielmann[!is.na(JanSpielmann$U17), "ID"],
  "U19" = JanSpielmann[!is.na(JanSpielmann$U19), "ID"],
  "U23" = JanSpielmann[!is.na(JanSpielmann$U23), "ID"],
  "Profis" = JanSpielmann[!is.na(JanSpielmann$Profis), "ID"]
)
lapply(NormSessions, length)


ermittleDieSessionErgebnisse <- function(SessionIDs){
  Resultate <- data.frame("SessionID"=c(), "Fiedler2016a"=c(), "FBt"=c(), "FBq"=c())
  for (SessionID in SessionIDs){
    EineSession <- (DF[DF$keyS==SessionID & DF$ItemID!="unbekannt", ])
    EineSession <- EineSession[order(EineSession$idX), ]
    print(paste0("Ich ermittle nun das Sessionergebnis von Session ", SessionID))

      SessionErgebnisQuote <- mean(EineSession$FBq)
      SessionErgebnisTime <- mean(EineSession$FBt)
      SessionErgebnisLevel <- EineSession[EineSession$idX==max(EineSession$idX), c("Fiedler2016a")]

    Resultate <- rbind(Resultate, data.frame("SessionID"=SessionID, "Fiedler2016a"=SessionErgebnisLevel, "FBt"=SessionErgebnisTime, "FBq"=SessionErgebnisQuote))
  }
  return(Resultate)
}

NormSessionResults <- list(
  "Probanden" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["Probanden"]]),
  "U12" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U12"]]),
  "U13" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U13"]]),
  "U14" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U14"]]),
  "U15" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U15"]]),
  "U16" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U16"]]),
  "U17" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U17"]]),
  "U19" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U19"]]),
  "U23" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["U23"]]),
  "Profis" = ermittleDieSessionErgebnisse(SessionIDs = NormSessions[["Profis"]])
)

par(mfrow=c(5, 1))
plot(density(NormSessionResults$Probanden$Fiedler2016a), main="Probanden", xlim=c(-3, 3))
plot(density(NormSessionResults$U12$Fiedler2016a), main="U12", xlim=c(-3, 3))
plot(density(NormSessionResults$U13$Fiedler2016a), main="U13", xlim=c(-3, 3))
plot(density(NormSessionResults$U14$Fiedler2016a), main="U14", xlim=c(-3, 3))
plot(density(NormSessionResults$U15$Fiedler2016a), main="U15", xlim=c(-3, 3))

plot(density(NormSessionResults$U16$Fiedler2016a), main="U16", xlim=c(-3, 3))
plot(density(NormSessionResults$U17$Fiedler2016a), main="U17", xlim=c(-3, 3))
plot(density(NormSessionResults$U19$Fiedler2016a), main="U19", xlim=c(-3, 3))
plot(density(NormSessionResults$U23$Fiedler2016a), main="U23", xlim=c(-3, 3))
plot(density(NormSessionResults$Profis$Fiedler2016a), main="Profis", xlim=c(-3, 3))

library(ggplot2)
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }

  if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

FarbPalette <- data.frame(
  red = seq(from = 13, to=200, length.out = 10)/255,
  green = seq(from = 83, to=100, length.out = 10)/255,
  blue = seq(from = 97, to=0, length.out=10)/255
)
FarbPalette <- FarbPalette[10:1,]
CavoritFarbPalette <- list()
for (i in 1:10){
  CavoritFarbPalette <- c(CavoritFarbPalette, rgb(FarbPalette[i, 1], FarbPalette[i, 2], FarbPalette[i, 3]))
}



gPbn <- ggplot(NormSessionResults$Probanden, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[1]) + xlim(-3, 3) + ggtitle("Normwerteverteilung Probanden")
g12 <- ggplot(NormSessionResults$U12, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[2]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U12")
g13 <- ggplot(NormSessionResults$U13, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[3]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U13")
g14 <- ggplot(NormSessionResults$U14, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[4]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U14")
g15 <- ggplot(NormSessionResults$U15, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[5]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U15")
g16 <- ggplot(NormSessionResults$U16, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[6]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U16")
g17 <- ggplot(NormSessionResults$U17, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[7]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U17")
g19 <- ggplot(NormSessionResults$U19, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[8]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U19")
g23 <- ggplot(NormSessionResults$U23, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[9]) + xlim(-3, 3) + ggtitle("Normwerteverteilung U23")
gProfis <- ggplot(NormSessionResults$Profis, aes(x = Fiedler2016a)) + geom_density(fill=CavoritFarbPalette[10]) + xlim(-3, 3) + ggtitle("Normwerteverteilung Profis")


multiplot(gPbn, g12, g13, g14, g15, g16, g17, g19, g23, gProfis)


## Normtabelle
Normtabelle_Probanden <- data.frame(
  "Level" = sort(NormSessionResults$Probanden$Fiedler2016a),
  "Prozentrang" = round(1:length(NormSessionResults$Probanden$Fiedler2016a)/length(NormSessionResults$Probanden$Fiedler2016a)*100,3)
)

library(xtable)
xtable(Normtabelle_Probanden)
write.csv2(x=Normtabelle_Probanden, file = "~/Desktop/Normtabelle")
library(jsonlite)
JSONstring <- jsonlite::toJSON(NormSessionResults, pretty = TRUE)
write(x=JSONstring, file="~/Desktop/Normen.json")

