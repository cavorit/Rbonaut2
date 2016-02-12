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



SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
SQL$score <- SQL$points
DF <- SQL2DF(SQL = SQL)

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

