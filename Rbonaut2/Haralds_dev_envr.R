rm(list=ls())
library(Rbonaut2)

########### SCHRITT 1: Hole SQL-Query

########### SCHRITT 2: SQL2DF
Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/2_ChristianMautner_PhD/RAW/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-21Von2016-01-16Bis2016-01-16.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/4_Inder/SQLmanuelleQeuryVonCgoalBereitgestelltAm2015-12-14Von2015-09-30.csv" # harmlose warnings() bei den Namen
#Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/5_IvanGojak_MA/RAW/SQLmanuelleQueryvonCgoalBereitgestelltAm2015-12-14von2015-12-05bis2015-12-05.csv" # Fehlermeldung wegen ; in Namen
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/10_AndreasKlundt_MA/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-07Von2015-10-17Bis2015-10-17.csv"

Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-09-28Bis2015-10-04.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-10-05Bis2015-10-11.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-10-12Bis2015-10-18.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-10-19Bis2015-10-25.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-10-26Bis2015-11-01.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-11-02Bis2015-11-08.csv"
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage Oktober-November 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-02-09Von2015-11-09Bis2015-11-15.csv"

Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-01-01Bis2015-01-31.csv" # Jan
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-02-01Bis2015-02-28.csv" # Feb
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-03-01Bis2015-03-31.csv" # Mrz
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-04-01Bis2015-04-30.csv" # Avr
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-05-01Bis2015-05-31.csv" # Mai
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-06-01Bis2015-06-30.csv" # Jun
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-07-01Bis2015-07-31.csv" # Jul
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-08-01Bis2015-08-30.csv" # Aug
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-09-01Bis2015-09-31.csv" # Spt
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-10-01Bis2015-10-30.csv" # Okt
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-11-01Bis2015-11-31.csv" # Nov
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-12-01Bis2015-12-30.csv" # Dez

JAN2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-01-01Bis2015-01-31.csv" # Jan
FEB2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-02-01Bis2015-02-28.csv" # Feb
MRZ2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-03-01Bis2015-03-31.csv" # Mrz
APR2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-04-01Bis2015-04-30.csv" # Avr
MAI2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-05-01Bis2015-05-31.csv" # Mai
JUN2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-06-01Bis2015-06-30.csv" # Jun
JUL2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-07-01Bis2015-07-31.csv" # Jul
AUG2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-08-01Bis2015-08-30.csv" # Aug
SPT2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-09-01Bis2015-09-31.csv" # Spt
OKT2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-10-01Bis2015-10-30.csv" # Okt
NOV2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-11-01Bis2015-11-31.csv" # Nov
DEZ2015CSV <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Baseline-Abfrage2014-2015/RAW/Abfrage 2015/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-27Von2015-12-01Bis2015-12-30.csv" # Dez


JAN2015SQL <- read.csv(file=JAN2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
FEB2015SQL <- read.csv(file=FEB2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
MRZ2015SQL <- read.csv(file=MRZ2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
APR2015SQL <- read.csv(file=APR2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
MAI2015SQL <- read.csv(file=MAI2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
JUN2015SQL <- read.csv(file=JUN2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
JUL2015SQL <- read.csv(file=JUL2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
AUG2015SQL <- read.csv(file=AUG2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
SPT2015SQL <- read.csv(file=SPT2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
OKT2015SQL <- read.csv(file=OKT2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
NOV2015SQL <- read.csv(file=NOV2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
DEZ2015SQL <- read.csv(file=DEZ2015CSV, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)

JAN2015SQL$score <- JAN2015SQL$fbn_points # wegen CGoal-Bug temporär
FEB2015SQL$score <- FEB2015SQL$fbn_points # wegen CGoal-Bug temporär
MRZ2015SQL$score <- MRZ2015SQL$fbn_points # wegen CGoal-Bug temporär
APR2015SQL$score <- APR2015SQL$fbn_points # wegen CGoal-Bug temporär
MAI2015SQL$score <- MAI2015SQL$fbn_points # wegen CGoal-Bug temporär
JUN2015SQL$score <- JUN2015SQL$fbn_points # wegen CGoal-Bug temporär
JUL2015SQL$score <- JUL2015SQL$fbn_points # wegen CGoal-Bug temporär
AUG2015SQL$score <- AUG2015SQL$fbn_points # wegen CGoal-Bug temporär
SPT2015SQL$score <- SPT2015SQL$fbn_points # wegen CGoal-Bug temporär
OKT2015SQL$score <- OKT2015SQL$fbn_points # wegen CGoal-Bug temporär
NOV2015SQL$score <- NOV2015SQL$fbn_points # wegen CGoal-Bug temporär
DEZ2015SQL$score <- DEZ2015SQL$fbn_points # wegen CGoal-Bug temporär


JAN2015DF <- SQL2DF(SQL = JAN2015SQL)
FEB2015DF <- SQL2DF(SQL = FEB2015SQL)
#MRZ2015DF <- SQL2DF(SQL = MRZ2015SQL)
#APR2015DF <- SQL2DF(SQL = APR2015SQL)
#MAI2015DF <- SQL2DF(SQL = MAI2015SQL)
#JUN2015DF <- SQL2DF(SQL = JUN2015SQL)
#JUL2015DF <- SQL2DF(SQL = JUL2015SQL)
#AUG2015DF <- SQL2DF(SQL = AUG2015SQL)
#SPT2015DF <- SQL2DF(SQL = SPT2015SQL)
#OKT2015DF <- SQL2DF(SQL = OKT2015SQL)
#NOV2015DF <- SQL2DF(SQL = NOV2015SQL)
#DEZ2015DF <- SQL2DF(SQL = DEZ2015SQL)


system('say "Die Berechnungen sind fertig."')
DF <- rbind(JAN2015DF, FEB2015DF)#, MRZ2015DF, APR2015DF, MAI2015DF, JUN2015DF, JUL2015DF, AUG2015DF, SPT2015DF, OKT2015DF, NOV2015DF, DEZ2015DF)
table(DF$ItemID)

########### erstelle eine neue ItemBank
DF = DF
ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))

# erstelleRaschMatrixSkeleton <- function(DF, ItemIDNamen){
#   ## erstelle RaschMatrix-Skeletton
#   SessionIndex <- unique(DF$idS)
#   RaschMatrixSkeleton <- matrix(NA, ncol=length(ItemIDNamen), nrow=length(SessionIndex))
#   colnames(RaschMatrixSkeleton) <- ItemIDNamen
#   rownames(RaschMatrixSkeleton) <- unique(DF$idS)
#   return(RaschMatrixSkeleton)
# }


# fillRaschMatrixSkeleton <- function(DF, ItemIDNamen, RaschMatrixSkeleton){
#   SessionIndex <- unique(DF$idS)
#   for (S in SessionIndex){# S <- SessionIndex[1]
#     EineSession <- DF[DF$idS==S,]
#     for (B in EineSession$idX){ # B <- EineSession$idX[1]
#       EinBall <- EineSession[EineSession$idX==B,]
#       if (  is.element(EinBall$ItemID, colnames(RaschMatrixSkeleton))  ){RaschMatrixSkeleton[rownames(RaschMatrixSkeleton)==S, EinBall$ItemID] <- EinBall$ItemResponse}
#     }
#   }
#   return(RaschMatrixSkeleton)
# }

implodeRaschMatrix4Quality <- function(RaschMatrixSkeleton){
  ## nur die Sessions, die ausreichend viele richtig erkannte Items hat
  AnzahlErkannterItems <- 32-apply(is.na(RaschMatrixSkeleton), 1, sum)
  RaschMatrixQualitaet <- RaschMatrixSkeleton[AnzahlErkannterItems>=30,]
  return(RaschMatrixQualitaet)
}

RaschMatrixSkeleton <- erstelleRaschMatrixSkeleton(DF=DF, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeletonFilled <- filledRaschMatrixSkeleton(DF=DF, RaschMatrixSkeleton = RaschMatrixSkeleton)

head(RaschMatrixQualitaet)

### Rasch-Analyse
library(eRm)
fit <- RM(RaschMatrixQualitaet)
summary(fit)
fit$betapar

test01 <- LRtest(fit, splitcr="mean", se=TRUE) # es liegt Modellverletzung vor, da signifikant unterschiedliche Itemmodellierungen für die besseren und die schlechteren 50% der Probanden ermittelt werden.
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT01:BT08", beta.subset = 0:7)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT09:BT16", beta.subset = 8:15)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT17:BT24", beta.subset = 16:23)
plotGOF(test01, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT25:BT32", beta.subset = 24:32)

#### Analyse unterschiedlicher Teams

U12 <- DF[DF$PbnTeam=="U 12",]
U13 <- DF[DF$PbnTeam=="U 13",]
U14 <- DF[DF$PbnTeam=="U 14",]
U15 <- DF[DF$PbnTeam=="U 15",]
U16 <- DF[DF$PbnTeam=="U 16",]
U17 <- DF[DF$PbnTeam=="U 17",]
U19 <- DF[DF$PbnTeam=="U 19",]
U23 <- DF[DF$PbnTeam=="U 23",]

RaschMatrixSkeleton <- erstelleRaschMatrixSkeleton(DF = U13, ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2)))
RaschMatrixSkeletonFilled <- fillRaschMatrixSkeleton(DF = U13, RaschMatrixSkeleton = RaschMatrixSkeleton, ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2)))
RaschU13 <- implodeRaschMatrix4Quality(RaschMatrixSkeleton = RaschMatrixSkeletonFilled)
fit <- RM(RaschU13)
testU13 <- LRtest(fit, splitcr="mean", se=TRUE)
summary(testU13)
