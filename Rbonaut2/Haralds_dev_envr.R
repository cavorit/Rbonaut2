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

SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
head(SQL)
SQL$score <- SQL$fbn_points # wegen CGoal-Bug temporär
DF <- SQL2DF(SQL = SQL)
system('say "Die Berechnungen sind fertig."')
table(DF$ItemID)
########### erstelle eine neue ItemBank
SessionIndex <- unique(DF$idS)
RaschMatrix <- matrix(NA, ncol=32, nrow=length(SessionIndex))
colnames(RaschMatrix) <- paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))
rownames(RaschMatrix) <- unique(DF$idS)
RaschMatrix

for (S in SessionIndex){# S <- SessionIndex[1]
  EineSession <- DF[DF$idS==S,]
  for (B in EineSession$idX){ # B <- EineSession$idX[1]
    EinBall <- EineSession[EineSession$idX==B,]
    if (is.element(EinBall$ItemID, colnames(RaschMatrix))){RaschMatrix[S, EinBall$ItemID] <- EinBall$ItemResponse}
  }
}

RaschMatrix

#X <- DF[DF$Date == as.Date("2015-04-30") & DF$PbnName == "Gutzeit, Jan", c("idX", "adrM", "adrW", "RW", "AW")]
#write.csv2(file = "~/Desktop/BL3220150430JanGutzeit.csv", x=X, sep=";")
