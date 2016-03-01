rm(list=ls())
library(Rbonaut2)

# Anfangsdatum =  "2013-12-01"
# Enddatum =      "2013-12-31"
# Dateiname =     "RAW2013-12"
#
# # ########### SCHRITT 1: Hole SQL-Query
# SQL <- askDB(Anfangsdatum = Anfangsdatum, Enddatum = Enddatum)
#writeRAW(SQL = SQL, Dateiname = Dateiname)
#readRAW(Dateiname = Dateiname)
#
# # ########### SCHRITT 2: augmentRAW
# DF <- augmentRAW(SQL = SQL)
# writeAUGMENTED(DF=DF1415, Dateiname="AUGMENTED2013-12")
# system('say "Iche habe fertig." -v Alice')
# DF1415 <- NULL
readAUGMENTED(Dateiname = "AUGMENTED2013-12")
DF2013_12 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-01")
DF2014_01 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-02")
DF2014_02 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-03")
DF2014_03 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-04")
DF2014_04 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-05")
DF2014_05 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-06")
DF2014_06 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-07")
DF2014_07 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-08")
DF2014_08 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-09")
DF2014_09 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-10")
DF2014_10 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-11")
DF2014_11 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2014-12")
DF2014_12 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-01")
DF2015_01 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-02")
DF2015_02 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-03")
DF2015_03 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-04")
DF2015_04 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-05")
DF2015_05 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-06")
DF2015_06 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-07")
DF2015_07 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-08")
DF2015_08 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-09")
DF2015_09 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-10")
DF2015_10 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-11")
DF2015_11 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2015-12")
DF2015_12 <- DF

readAUGMENTED(Dateiname = "AUGMENTED2016-01")
DF2016_01 <- DF

#table(DF$ItemID)
########### erstelle eine neue ItemBank
ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))

RaschMatrixSkeleton2013_12 <- erstelleRaschMatrixSkeleton(DF=DF2013_12, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_01 <- erstelleRaschMatrixSkeleton(DF=DF2014_01, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_02 <- erstelleRaschMatrixSkeleton(DF=DF2014_02, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_03 <- erstelleRaschMatrixSkeleton(DF=DF2014_03, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_04 <- erstelleRaschMatrixSkeleton(DF=DF2014_04, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_05 <- erstelleRaschMatrixSkeleton(DF=DF2014_05, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_06 <- erstelleRaschMatrixSkeleton(DF=DF2014_06, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_07 <- erstelleRaschMatrixSkeleton(DF=DF2014_07, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_08 <- erstelleRaschMatrixSkeleton(DF=DF2014_08, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_09 <- erstelleRaschMatrixSkeleton(DF=DF2014_09, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_10 <- erstelleRaschMatrixSkeleton(DF=DF2014_10, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_11 <- erstelleRaschMatrixSkeleton(DF=DF2014_11, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2014_12 <- erstelleRaschMatrixSkeleton(DF=DF2014_12, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_01 <- erstelleRaschMatrixSkeleton(DF=DF2015_01, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_02 <- erstelleRaschMatrixSkeleton(DF=DF2015_02, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_03 <- erstelleRaschMatrixSkeleton(DF=DF2015_03, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_04 <- erstelleRaschMatrixSkeleton(DF=DF2015_04, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_05 <- erstelleRaschMatrixSkeleton(DF=DF2015_05, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_06 <- erstelleRaschMatrixSkeleton(DF=DF2015_06, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_07 <- erstelleRaschMatrixSkeleton(DF=DF2015_07, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_08 <- erstelleRaschMatrixSkeleton(DF=DF2015_08, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_09 <- erstelleRaschMatrixSkeleton(DF=DF2015_09, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_10 <- erstelleRaschMatrixSkeleton(DF=DF2015_10, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_11 <- erstelleRaschMatrixSkeleton(DF=DF2015_11, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2015_12 <- erstelleRaschMatrixSkeleton(DF=DF2015_12, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeleton2016_01 <- erstelleRaschMatrixSkeleton(DF=DF2016_01, ItemIDNamen = ItemIDNamen)

RaschMatrixSkeletonFilled2013_12 <- fillRaschMatrixSkeleton(DF=DF2013_12, RaschMatrixSkeleton = RaschMatrixSkeleton2013_12)
RaschMatrixSkeletonFilled2014_01 <- fillRaschMatrixSkeleton(DF=DF2014_01, RaschMatrixSkeleton = RaschMatrixSkeleton2014_01)
RaschMatrixSkeletonFilled2014_02 <- fillRaschMatrixSkeleton(DF=DF2014_02, RaschMatrixSkeleton = RaschMatrixSkeleton2014_02)
RaschMatrixSkeletonFilled2014_03 <- fillRaschMatrixSkeleton(DF=DF2014_03, RaschMatrixSkeleton = RaschMatrixSkeleton2014_03)
RaschMatrixSkeletonFilled2014_04 <- fillRaschMatrixSkeleton(DF=DF2014_04, RaschMatrixSkeleton = RaschMatrixSkeleton2014_04)
RaschMatrixSkeletonFilled2014_05 <- fillRaschMatrixSkeleton(DF=DF2014_05, RaschMatrixSkeleton = RaschMatrixSkeleton2014_05)
RaschMatrixSkeletonFilled2014_06 <- fillRaschMatrixSkeleton(DF=DF2014_06, RaschMatrixSkeleton = RaschMatrixSkeleton2014_06)
RaschMatrixSkeletonFilled2014_07 <- fillRaschMatrixSkeleton(DF=DF2014_07, RaschMatrixSkeleton = RaschMatrixSkeleton2014_07)
RaschMatrixSkeletonFilled2014_08 <- fillRaschMatrixSkeleton(DF=DF2014_08, RaschMatrixSkeleton = RaschMatrixSkeleton2014_08)
RaschMatrixSkeletonFilled2014_09 <- fillRaschMatrixSkeleton(DF=DF2014_09, RaschMatrixSkeleton = RaschMatrixSkeleton2014_09)
RaschMatrixSkeletonFilled2014_10 <- fillRaschMatrixSkeleton(DF=DF2014_10, RaschMatrixSkeleton = RaschMatrixSkeleton2014_10)
RaschMatrixSkeletonFilled2014_11 <- fillRaschMatrixSkeleton(DF=DF2014_11, RaschMatrixSkeleton = RaschMatrixSkeleton2014_11)
RaschMatrixSkeletonFilled2014_12 <- fillRaschMatrixSkeleton(DF=DF2014_12, RaschMatrixSkeleton = RaschMatrixSkeleton2014_12)
RaschMatrixSkeletonFilled2015_01 <- fillRaschMatrixSkeleton(DF=DF2015_01, RaschMatrixSkeleton = RaschMatrixSkeleton2015_01)
RaschMatrixSkeletonFilled2015_02 <- fillRaschMatrixSkeleton(DF=DF2015_02, RaschMatrixSkeleton = RaschMatrixSkeleton2015_02)
RaschMatrixSkeletonFilled2015_03 <- fillRaschMatrixSkeleton(DF=DF2015_03, RaschMatrixSkeleton = RaschMatrixSkeleton2015_03)
RaschMatrixSkeletonFilled2015_04 <- fillRaschMatrixSkeleton(DF=DF2015_04, RaschMatrixSkeleton = RaschMatrixSkeleton2015_04)
RaschMatrixSkeletonFilled2015_05 <- fillRaschMatrixSkeleton(DF=DF2015_05, RaschMatrixSkeleton = RaschMatrixSkeleton2015_05)
RaschMatrixSkeletonFilled2015_06 <- fillRaschMatrixSkeleton(DF=DF2015_06, RaschMatrixSkeleton = RaschMatrixSkeleton2015_06)
RaschMatrixSkeletonFilled2015_07 <- fillRaschMatrixSkeleton(DF=DF2015_07, RaschMatrixSkeleton = RaschMatrixSkeleton2015_07)
RaschMatrixSkeletonFilled2015_08 <- fillRaschMatrixSkeleton(DF=DF2015_08, RaschMatrixSkeleton = RaschMatrixSkeleton2015_08)
RaschMatrixSkeletonFilled2015_09 <- fillRaschMatrixSkeleton(DF=DF2015_09, RaschMatrixSkeleton = RaschMatrixSkeleton2015_09)
RaschMatrixSkeletonFilled2015_10 <- fillRaschMatrixSkeleton(DF=DF2015_10, RaschMatrixSkeleton = RaschMatrixSkeleton2015_10)
RaschMatrixSkeletonFilled2015_11 <- fillRaschMatrixSkeleton(DF=DF2015_11, RaschMatrixSkeleton = RaschMatrixSkeleton2015_11)
RaschMatrixSkeletonFilled2015_12 <- fillRaschMatrixSkeleton(DF=DF2015_12, RaschMatrixSkeleton = RaschMatrixSkeleton2015_12)
RaschMatrixSkeletonFilled2016_01 <- fillRaschMatrixSkeleton(DF=DF2016_01, RaschMatrixSkeleton = RaschMatrixSkeleton2016_01)


RaschMatrixSkeletonFilledAndImploded4Quality2013_12 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2013_01)
RaschMatrixSkeletonFilledAndImploded4Quality2014_01 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_01)
RaschMatrixSkeletonFilledAndImploded4Quality2014_02 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_02)
RaschMatrixSkeletonFilledAndImploded4Quality2014_03 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_03)
RaschMatrixSkeletonFilledAndImploded4Quality2014_04 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_04)
RaschMatrixSkeletonFilledAndImploded4Quality2014_05 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_05)
RaschMatrixSkeletonFilledAndImploded4Quality2014_06 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_06)
RaschMatrixSkeletonFilledAndImploded4Quality2014_07 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_07)
RaschMatrixSkeletonFilledAndImploded4Quality2014_08 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_08)
RaschMatrixSkeletonFilledAndImploded4Quality2014_09 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_09)
RaschMatrixSkeletonFilledAndImploded4Quality2014_10 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_10)
RaschMatrixSkeletonFilledAndImploded4Quality2014_11 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_11)
RaschMatrixSkeletonFilledAndImploded4Quality2014_12 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2014_12)
RaschMatrixSkeletonFilledAndImploded4Quality2014_01 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_01)
RaschMatrixSkeletonFilledAndImploded4Quality2014_02 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_02)
RaschMatrixSkeletonFilledAndImploded4Quality2014_03 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_03)
RaschMatrixSkeletonFilledAndImploded4Quality2015_04 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_04)
RaschMatrixSkeletonFilledAndImploded4Quality2015_05 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_05)
RaschMatrixSkeletonFilledAndImploded4Quality2015_06 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_06)
RaschMatrixSkeletonFilledAndImploded4Quality2015_07 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_07)
RaschMatrixSkeletonFilledAndImploded4Quality2015_08 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_08)
RaschMatrixSkeletonFilledAndImploded4Quality2015_09 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_09)
RaschMatrixSkeletonFilledAndImploded4Quality2015_10 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_10)
RaschMatrixSkeletonFilledAndImploded4Quality2015_11 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_11)
RaschMatrixSkeletonFilledAndImploded4Quality2015_12 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2015_12)
RaschMatrixSkeletonFilledAndImploded4Quality2016_01 <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled2016_01)

RM2013_12 <- RaschMatrixSkeletonFilledAndImploded4Quality2013_12
RM2014_01 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_01
RM2014_02 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_02
RM2014_03 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_03
RM2014_04 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_04
RM2014_05 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_05
RM2014_06 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_06
RM2014_07 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_07
RM2014_08 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_08
RM2014_09 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_09
RM2014_10 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_10
RM2014_11 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_11
RM2014_12 <- RaschMatrixSkeletonFilledAndImploded4Quality2014_12
RM2015_01 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_01
RM2015_02 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_02
RM2015_03 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_03
RM2015_04 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_04
RM2015_05 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_05
RM2015_06 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_06
RM2015_07 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_07
RM2015_08 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_08
RM2015_09 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_09
RM2015_10 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_10
RM2015_11 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_11
RM2015_12 <- RaschMatrixSkeletonFilledAndImploded4Quality2015_12
RM2016_01 <- RaschMatrixSkeletonFilledAndImploded4Quality2016_01

head(RM)

## Füge das Alter hinzu
RM <- as.data.frame(RM)
RM <- cbind(RM, DF[is.element(DF$keyS,rownames(RM)) & DF$idX == 0, c("PbnJahre", "keyS")])
head(RM)
# RM$keyS == rownames(RM) # TRUE

### Rasch-Analyse
library(eRm)
fit <- RM(RM)
summary(fit)
fit$betapar

test01 <- LRtest(fit, splitcr="mean", se=TRUE) # es liegt Modellverletzung vor, da signifikant unterschiedliche Itemmodellierungen für die besseren und die schlechteren 50% der Probanden ermittelt werden.
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT01:BT08", beta.subset = 0:7)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT09:BT16", beta.subset = 8:15)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT17:BT24", beta.subset = 16:23)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT25:BT32", beta.subset = 24:32)


