rm(list=ls())
library(Rbonaut2)

Anfangsdatum = "2015-04-01"
Enddatum = "2015-04-30"
Dateiname = "RAW-2015-04"

########### SCHRITT 1: Hole SQL-Query
SQL <- askDB(Anfangsdatum = Anfangsdatum, Enddatum = Enddatum)
writeRAW(SQL = SQL, Dateiname = Dateiname)
readRAW(Dateiname = Dateiname)

########### SCHRITT 2: augmentRAW
DF <- augmentRAW(SQL = SQL)
system('say "Ich habe fertig."')
table(DF$ItemID)

########### erstelle eine neue ItemBank
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


