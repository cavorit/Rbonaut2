rm(list=ls())
library(Rbonaut2)

#Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")

# 1. Ausdauer Vortest:  kein Datensatz auf Ballebene

# 2. Christian Mautner: Datensatz auf Ballebene im XML-Format

# 3. Helix: kein Datensatz auf Ballebene

# 4. Inder
Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/4_Inder/SQLmanuelleQeuryVonCgoalBereitgestelltAm2015-12-14Von2015-09-30.csv"
isUTF8(file=Pfad)
SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
#View(SQL)
DF <- SQL2DF(SQL = SQL)
#View(DF)


# 5. Ivan Gojak:
# Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/5_IvanGojak_MA/RAW/SQL Abfrage Ivan Gojak 05.12.2015.csv"
# SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors=FALSE)
# # ab Zeile 53 Probleme wegen Janis; Miller
# View(SQL)
# DF <- SQL2DF(SQL=SQL)
# head(DF)

# 6. Karsten Specht: nur Faktorenanalytische Daten

# 7. Kevin Frey
# Pfad <- "~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Hoffenheim/Projekte/7_KevinFrey_MA/Rohwerte_Footbonaut.csv"
# SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors=FALSE)
# View(SQL)
# DF <- SQL2DF(SQL=SQL)
# head(DF)

# 8. Rico Wehrle : # noch keine SQL-Daten
# CSV mit , getrennt

# Merge die ItemBank
ItemBank <- Rbonaut2::readItemBank()
M <- merge(x=DF, y=ItemBank[2:31,], all.x=TRUE, by=c("adrM", "adrW"))
View(M)


