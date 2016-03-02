rm(list=ls())
library(Rbonaut2)
# DB muss erst von Hand gestartet werden.

WievielterMonat = 2

Monate <- c("2013-12",
            "2014-01", "2014-02", "2014-03", "2014-04",
            "2014-05", "2014-06", "2014-07", "2014-08",
            "2014-09", "2014-10", "2014-11", "2014-12",
            "2015-01", "2015-02", "2015-03", "2015-04",
            "2015-05","2015-06", "2015-07",  "2015-08",
            "2015-09", "2015-10", "2015-11","2015-12",
            "2016-01")
LetzterTag <- c(31,
               rep(c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31), times=2),
               31)

Anfangsdatum  = paste0(Monate, "-01")[WievielterMonat]  #"2013-12-01"
Enddatum      = paste(Monate, LetzterTag, sep = "-")[WievielterMonat]  #"2013-12-31"
Dateiname     = paste0("RAW", Monate)[WievielterMonat] #    "RAW2013-12"

########### SCHRITT 1: Hole SQL-Query
SQL <- askDB(Anfangsdatum = Anfangsdatum, Enddatum = Enddatum)
writeRAW(SQL = SQL, Dateiname = Dateiname)
readRAW(Dateiname = Dateiname)

########### SCHRITT 2: augmentRAW
DF <- augmentRAW(SQL = SQL)
writeAUGMENTED(DF=DF, Dateiname= paste0("AUGMENTED", Monate[WievielterMonat]) ) # AUGMENTED2014-01
system('say "Iche habe fertig." -v Alice')
table(DF$ItemID)

########### erstelle eine neue ItemBank
ItemIDNamen = paste0("BL", gibZahlFuehrendeNullen(1:32, digits=2))

readAUGMENTED(Dateiname = "AUGMENTED2014-01")# paste0("AUGMENTED", Monate[WievielterMonat]) )

RaschMatrixSkeleton <- erstelleRaschMatrixSkeleton(DF=DF, ItemIDNamen = ItemIDNamen)
RaschMatrixSkeletonFilled <- fillRaschMatrixSkeleton(DF=DF, RaschMatrixSkeleton = RaschMatrixSkeleton)
RaschMatrixSkeletonFilledAndImploded4Quality <- implodeRaschMatrix4Quality(RaschMatrixSkeletonFilled = RaschMatrixSkeletonFilled)
RM <- RaschMatrixSkeletonFilledAndImploded4Quality

    ## Füge das Alter hinzu
    RM <- as.data.frame(RM)
    RM <- cbind(RM, DF[is.element(DF$keyS,rownames(RM)) & DF$idX == 0, c("PbnJahre", "keyS")])
    head(RM)
    # RM$keyS == rownames(RM) # TRUE

    if (!any(is.element(ls(), "RMtotal"))){RMtotal <- NULL}
    RMtotal <- rbind(RMtotal, RM)


    ## Rasch-Analyse
    library(eRm)
    fit <- RM(RM[, ItemIDNamen])
    summary(fit)
    fit$betapar

    ## Modellgeltungstest
    test <- LRtest(fit, splitcr="mean", se=TRUE)
    plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT01:BT08", beta.subset = 0:7)
    plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT09:BT16", beta.subset = 8:15)
    plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT17:BT24", beta.subset = 16:23)
    plotGOF(test, xlab="Randsumme < Mittelwert", ylab="Randsumme > Mittelwert", tlab="number", conf=list(gamma=0.95, col=1), main="BT25:BT32", beta.subset = 24:32)


