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

# Merge die ItemBank
getItemICC <- function(DF, ItemBank){
  M <- merge(x=DF, y=ItemBank, all.x=TRUE, by=c("AW", "RW", "HW", "vA")) # dieser Merge ignoriert sL und sR

  # ungetestetes Fehler-Handling
  if(is.element("ItemID.y", colnames(M))){
    warning("Ein bereits identifiziertes Item wurde erneut identifiziert. Alte ItemID und ItemCC drurch neue überschrieben.")
    M$ItemID <- M$ItemID.y
    M$a <- M$a.y
    M$b <- M$b.y
    M$c <- M$c.y
    M$d <- M$d.y
  }

  # die Item-ID und Item-ICC des harten Merge werden mit NA überschrieben, falls weiche Kriterien sL und sR zu
  # weich sind
  cond0 <- !is.na(M$sL.y)
  cond1 <- (abs(M$sL.x - M$sL.y) < 25) # sL weicht zu stark von der ItemBank ab -> Item-Identifikation rückgängig machen
  cond2 <- (abs(M$sR.y - M$sR.y) < 25) # sR weichtzu stark von der ItemBank ab -> Item-Identifikation rückgängig machen
  cond <- cond0 & cond1 & cond2
  #print(cond)
  #print(head(M))
  M[!cond, c("ItemID", "sL.y", "sR.y", "a", "b", "c", "d")] <- NA

  # nun in M noch sL.x und sR.x in sL und sR umbenennen
  names(M)[names(M)=="sL.x"] <- "sL"
  names(M)[names(M)=="sR.x"] <- "sR"
  Erg <- M[, c(names(DF), "ItemID")] # getItemID
  Erg <- M[, c(names(DF), "ItemID", "ICCa", "ICCb", "ICCc", "ICCd")] # getItemICC
  return(Erg)
}

F14 <- getItemICC(DF=DF, ItemBank=readItemBank())
View(F14)
