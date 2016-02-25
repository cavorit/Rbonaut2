rm(list=ls())
library(Rbonaut2)

########### SCHRITT 1: Hole SQL-Query
DF <- askDB(Anfangsdatum = "2016-01-01", Enddatum = "2016-01-31")
writeRAW(DF = DF, Dateiname = "gulugulu")
DFreloaded <- readRAW(Dateiname = "gulugulu")


########### SCHRITT 2: SQL2DF
#JAN2015DF <- SQL2DF(SQL = JAN2015SQL)
#FEB2015DF <- SQL2DF(SQL = FEB2015SQL)
#MRZ2015DF <- SQL2DF(SQL = MRZ2015SQL)
APR2015DF <- SQL2DF(SQL = APR2015SQL)
#MAI2015DF <- SQL2DF(SQL = MAI2015SQL)
#JUN2015DF <- SQL2DF(SQL = JUN2015SQL)
#JUL2015DF <- SQL2DF(SQL = JUL2015SQL)
#AUG2015DF <- SQL2DF(SQL = AUG2015SQL)
#SPT2015DF <- SQL2DF(SQL = SPT2015SQL)
#OKT2015DF <- SQL2DF(SQL = OKT2015SQL)
#NOV2015DF <- SQL2DF(SQL = NOV2015SQL)
#DEZ2015DF <- SQL2DF(SQL = DEZ2015SQL)


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


