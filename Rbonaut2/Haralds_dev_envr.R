rm(list=ls())
library(Rbonaut2)

########### SCHRITT 1: Hole SQL-Query

########### SCHRITT 2: SQL2DF
Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
isUTF8(Pfad)
# 1. Ausdauer Vortest:  kein Datensatz auf Ballebene
# 2. Christian Mautner: Datensatz auf Ballebene im XML-Format
# 3. Helix: kein Datensatz auf Ballebene
# 4. Inder
# Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/4_Inder/SQLmanuelleQeuryVonCgoalBereitgestelltAm2015-12-14Von2015-09-30.csv"
# isUTF8(Pfad)
# 5. Ivan Gojak:
# Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/5_IvanGojak_MA/RAW/SQL Abfrage Ivan Gojak 05.12.2015.csv"
# # ab Zeile 53 Probleme wegen Janis; Miller
# 6. Karsten Specht: nur Faktorenanalytische Daten
# 7. Kevin Frey
# Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/7_KevinFrey_MA/Rohwerte_Footbonaut.csv"
# isUTF8(Pfad)
 # 8. Rico Wehrle : # noch keine SQL-Daten

# RAW2DATA
SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
#View(SQL)
DF <- SQL2DF(SQL = SQL)
#View(DF)
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

for (i in 1:1000){
  Stimulus <- DF[i, ]
  ItemID <- detectItemID(Stimulus=Stimulus)
  cat(ItemID)
}


