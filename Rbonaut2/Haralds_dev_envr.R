rm(list=ls())
library(Rbonaut2)

ItemBank <- Rbonaut2::readItemBank()

Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
SQL <- read.csv2(file=Pfad, sep = ",", stringsAsFactors = FALSE, encoding = "utf8")
DF <- SQL2DF(SQL=SQL)


M <- merge(x=DF, y=ItemBank[2:31,], all.x=TRUE, by=c("adrM", "adrW"))
View(M)

SessionA <- M[M$idS=="FBN-Hoffenheim-2015-08-27-13:29:38", c("adrM", "adrW", "idX", "AW.x", "AW.y", "RW.x", "RW.y", "ItemID")]
SessionA <- M[M$idS=="FBN-Hoffenheim-2015-08-27-13:29:38",]

View(merge(x=SessionA, y=ItemBank[2:31,], all.x=TRUE, by=c("adrM", "adrW")))

library(Rbonaut)
data(BT32)
BT32[BT32$idS==7704,]

View(SessionA)

x <- as.character(SessionA$ItemID)
data.frame(BL = M[M$idS=="FBN-Hoffenheim-2015-08-27-13:00:23", "ItemID"], x = x)
# vergleiche Itemreihenfolge der 121. Session mit denen von Session A
data.frame(BL = M[M$idS==sort(unique(M$idS))[121], "ItemID"], x = x)

sort(unique(M$idS))
