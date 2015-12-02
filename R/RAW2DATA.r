rm(list=ls())
library(data.table)
library(Rbonaut)
source(file = "istFormatNachnameKommeVorname.R")
source(file = "getVorname.R" )
source(file = "getNachname.R")
source(file="getAdrWAlsListe.R")
source(file="isMultiTarget.R")
source(file="getFirstAdrW.R")
source(file="getSessionTimeStamp.R")
source(file="SQL2DF.R")

# Rico Wehrle Datensheet
DF <- read.csv2("../RAW/Daten Messung Rico Wehrle.csv", header = TRUE, nrows = 34, # ab Zeile 34 nur leere Felder
      stringsAsFactors = FALSE, encoding = "latin1")

DF <- data.frame(
  ProbandenID = DF$Proband_ID,
  Name = DF$Name,
  Vorname = DF$Vorname,
  Team = as.factor(DF$Team),
  Birthday = as.Date(DF$Date.Birth),
  Position = factor(DF$Position, levels = c("Mittelfeld", "Sturm", "Abwehr", "Torwart"),
                     labels = c("Mittelfeld", "Sturm", "Abwehr", "Torwart"), ordered = FALSE),
  Date = as.Date(DF$Day_Measurement),
  TQ1 = DF$Score_S1,
  HZ1 = DF$Speed_S1*1000,
  P1 = DF$Points_S1,
  TQ2 = DF$Score_S2,
  HZ2 = DF$Speed_S2*1000,
  P2 = DF$Points_S2
)

# Rico Wehrle SQL
SQL <- read.csv2("../RAW/Footbonaut_Datenabfrage_RicoWehrle.csv", header = TRUE, 
                 sep=",", stringsAsFactors = FALSE, encoding = "utf8")
DF <- SQL2DF(SQL=SQL)

# # Hier berechne ich für den Datensatz BT32 die AW und RW    
# data(BT32)
# tail(BT32)
# X <- SQL2DF.RW(BT32, BT32) # SQL2DFz96:123
# X$AW <- Rbonaut::played_angle(X$adrM, X$adrW)
# 
# head(X[X$idX==31, c("idB", "idX", "nB", "adrLast", "adrM", "adrW", "AW", "RW")])
# 
# ItemBank_CS32 <- X[1:32, c("AW", "RW", "sL", "sR", "vA")]
# ItemBankBT32 <- cbind(ItemBank_CS32, read.csv("../RAW/ItemBank.csv")[, -1])
# 
# write.csv(x = ItemBankBT32, file = "../DATA/ItemBankBT32.csv")
