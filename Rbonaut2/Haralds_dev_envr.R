rm(list=ls())
library(Rbonaut2)

Anfangsdatum = "2016-01-01"
Enddatum = "2016-01-31"
Dateiname = "RAW-2016-01"

########### SCHRITT 1: Hole SQL-Query
SQL <- askDB(Anfangsdatum = Anfangsdatum, Enddatum = Enddatum)
writeRAW(SQL = SQL, Dateiname = Dateiname)
readRAW(Dateiname = Dateiname)


########### SCHRITT 2: SQL2DF
JAN2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-01"))
FEB2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-02"))
MRZ2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-03"))
APR2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-04"))
MAI2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-05"))
JUN2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-06"))
JUL2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-07"))
AUG2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-08"))
SPT2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-09"))
OKT2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-10"))
NOV2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-11"))
DEZ2015DF <- SQL2DF(SQL = readRAW(Dateiname = "RAW-2015-12"))


system('say "Die Berechnungen sind fertig."')
#DF2015 <- rbind(JAN2015DF, FEB2015DF, MRZ2015DF, APR2015DF, MAI2015DF, JUN2015DF, JUL2015DF, AUG2015DF, SPT2015DF, OKT2015DF, NOV2015DF, DEZ2015DF)
DF2015 <- APR2015DF

table(DF2015$ItemID)

########### erstelle eine neue ItemBank
DF = DF2015
ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))

RaschMatrixSkeleton <- erstelleRaschMatrixSkeleton(DF=DF, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeletonFilled <- fillRaschMatrixSkeleton(DF=DF, RaschMatrixSkeleton = RaschMatrixSkeleton)
RaschMatrixSkeletonFilledAndImploded4Quality <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled)
RM <- RaschMatrixSkeletonFilledAndImploded4Quality
head(RM)

# Ich möchte einen Vektor haben, der zu jeder SessionID das Team (U13:U17, U19, U23) ermittelt und die gleiche Sortierung hat wie die RaschMatrix
SessionID_TeamID <- data.frame("SessionID"=NULL, "TeamID"=NULL)
for (SessionID in rownames(RM)){# SessionID <- "FBN-Hoffenheim-2015-04-30-18:37:31"
  TeamID <- unique(DF[DF$idS==SessionID, "PbnTeam"])
  if(length(TeamID)>1){stop("Alarm!!! Ich habe eine Session gefunden, die mehreren Teams zugeordnet ist. Abbruch.")}
  TMP <- data.frame("SessionID"=SessionID, "TeamID"=TeamID)
  SessionID_TeamID <- rbind(SessionID_TeamID, TMP)
}
SessionID_TeamID
table(SessionID_TeamID$TeamID)

### Rasch-Analyse
RM <- merge(as.data.frame(RM), SessionID_TeamID)
View(RM)
library(eRm)
fit <- RM(RM)
summary(fit)
fit$betapar

test01 <- LRtest(fit, splitcr="mean", se=TRUE) # es liegt Modellverletzung vor, da signifikant unterschiedliche Itemmodellierungen für die besseren und die schlechteren 50% der Probanden ermittelt werden.
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT01:BT08", beta.subset = 0:7)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT09:BT16", beta.subset = 8:15)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT17:BT24", beta.subset = 16:23)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT25:BT32", beta.subset = 24:32)


