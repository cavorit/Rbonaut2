rm(list=ls())
library(Rbonaut2)

ItemBank <- Rbonaut2::readItemBank()

Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
SQL <- read.csv2(file=Pfad, sep = ",", stringsAsFactors = FALSE, encoding = "utf8")
DF <- SQL2DF(SQL=SQL)
#DF$adrM <- as.integer(DF$adrM)
#DF$adrW <- as.integer(DF$adrW)
#DF$AW <- as.integer(DF$AW)
#DF$RW <- as.integer(DF$RW)



M <- merge(x=DF, y=ItemBank[2:31,], all.x=TRUE, by=c("adrM", "adrW"))
View(M)


