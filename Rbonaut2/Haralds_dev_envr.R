rm(list=ls())
library(Rbonaut2)

########### SCHRITT 1: Hole SQL-Query

########### SCHRITT 2: SQL2DF
Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/2_ChristianMautner_PhD/RAW/SQLmanuelleQueryVonCgoalBereitgestelltAm2016-01-21Von2016-01-16Bis2016-01-16.csv"
#isUTF8(Pfad)
SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
#View(SQL)
DF <- SQL2DF(SQL = SQL)
View(DF)
head(DF)
########### Schritt 3: Füge mit Hilfe von Itembanken neue Testergebnisse hinzu
ItemBank=readItemBank()
# Merge die ItemBank

F14 <- getItemICC(DF=DF, ItemBank=readItemBank())
View(F14)

########### Exkurs: erstelle eine neue ItemBank

RaschMatrix <- matrix(NA, ncol=32, nrow=5)
colnames(RaschMatrix) <- paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))
rownames(RaschMatrix) <- 1:nrow(RaschMatrix)
RaschMatrix

x <- NULL
for (i in 1:nrow(DF)){
  x <- c(x, detectItemResponse(DF[i,]))
}
x

View(detectItemResponse(DF))
