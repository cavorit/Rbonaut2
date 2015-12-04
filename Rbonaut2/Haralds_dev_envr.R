#rm(list=ls())

#library(Rbonaut)



# library(Rbonaut)
# data(BT32)
#
# ItemBank <- read.csv("~/Dropbox (Cavorit)/Cavorit/Forschungsprojekte/Forschungsprojekt_CLIP02/Berechnungen/cgoal_Testlauf_Adaptivität/ItemBank.csv")
# ItemBank$idX <- 0:31
# ItemBank
# X <- BT32[BT32$idS==8532, c("adrM", "adrW", "deg", "idX")]
# X
#
# ItemBank <- merge(x=ItemBank, y=X)
# ItemBank <- ItemBank[, -1]
# names(ItemBank) <- c("ItemID", "a", "b", "c", "d", "adrM", "adrW")
# ItemBank
#
#
# AW <- rep(NA, times=32)
# for (ball in 2:32){
#   letzterBall <- ItemBank[ball-1,]
#   jetzigerBall <- ItemBank[ball,]
#   erg <- Rbonaut::played_angle(adrM=letzterBall$adrW, adrW=jetzigerBall$adrM)
#   AW[ball] <- erg
# }
# AW
# ItemBank$RW <- Rbonaut::played_angle(adrM = ItemBank$adrM, adrW = ItemBank$adrW)
# ItemBank$AW <- AW
# ItemBank
#
# # ItemBank$idX <- 1:32
# fit <- lm(ItemBank$b~ItemBank$RW+ItemBank$AW)# + ItemBank$idX)
# summary(fit)
# # AW und RW erklären R^2 = 0.06854 und mit idX auch nur 0.077
#
# write.table(x = ItemBank, file="~/Desktop/ItemBank.csv")
