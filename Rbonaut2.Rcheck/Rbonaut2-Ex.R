pkgname <- "Rbonaut2"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('Rbonaut2')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("erstelleRaschMatrixSkeleton")
### * erstelleRaschMatrixSkeleton

flush(stderr()); flush(stdout())

### Name: erstelleRaschMatrixSkeleton
### Title: erstelleRaschMatrixSkeleton
### Aliases: erstelleRaschMatrixSkeleton

### ** Examples

rm(list=ls())
DF <- data.frame(c("SessionA", "SessionB"), c(22, 90), c(23, 18), c(10,12))
colnames(DF) <- c("idS", "It1", "It2", "It_von_wo_ganz_anders")
ItemIDNamen <- c("Item1", "Item2", "Item3")
print(DF)
erstelleRaschMatrixSkeleton(DF=DF, ItemIDNamen=ItemIDNamen)




cleanEx()
nameEx("getAdrWAlsListe")
### * getAdrWAlsListe

flush(stderr()); flush(stdout())

### Name: getAdrWAlsListe
### Title: getAdrWAlsListe
### Aliases: getAdrWAlsListe

### ** Examples

adrW <- c("{1, 2, 3, 4}", "{11, 12, 13, 14}")
getAdrWAlsListe(adrW = adrW)



cleanEx()
nameEx("getFirstAdrW")
### * getFirstAdrW

flush(stderr()); flush(stdout())

### Name: getFirstAdrW
### Title: getFirstArdW
### Aliases: getFirstAdrW

### ** Examples

getFirstAdrW(adrW=c("{2, 4, 5}", "{12, 19}", "{4}"))



cleanEx()
nameEx("getNachname")
### * getNachname

flush(stderr()); flush(stdout())

### Name: getNachname
### Title: getNachname
### Aliases: getNachname

### ** Examples

Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
getNachname(Spielername = Spielername)



cleanEx()
nameEx("getSessionTimeStamp")
### * getSessionTimeStamp

flush(stderr()); flush(stdout())

### Name: getSessionTimeStamp
### Title: getSessionTimeStamp
### Aliases: getSessionTimeStamp

### ** Examples

DatumString <- c("2015-08-27 18:59:25.328383+02", "2015-08-27 18:59:25.328383+02", "2015-08-27 18:59:25.328383+02")



cleanEx()
nameEx("getVorname")
### * getVorname

flush(stderr()); flush(stdout())

### Name: getVorname
### Title: getVorname
### Aliases: getVorname

### ** Examples

Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
getVorname(Spielername = Spielername)



cleanEx()
nameEx("gibZahlFuehrendeNullen")
### * gibZahlFuehrendeNullen

flush(stderr()); flush(stdout())

### Name: gibZahlFuehrendeNullen
### Title: gibZahlFuehrendeNullen
### Aliases: gibZahlFuehrendeNullen

### ** Examples

k = c(2, 7, 17, 299)
gibZahlFuehrendeNullen(k=k, digits=9)



cleanEx()
nameEx("istFormatNachnameKommaVorname")
### * istFormatNachnameKommaVorname

flush(stderr()); flush(stdout())

### Name: istFormatNachnameKommaVorname
### Title: istFormatNachnameKommaVorname
### Aliases: istFormatNachnameKommaVorname

### ** Examples

Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
istFormatNachnameKommaVorname(Spielername = Spielername)



cleanEx()
nameEx("itemID2Params")
### * itemID2Params

flush(stderr()); flush(stdout())

### Name: itemID2Params
### Title: itemID2Params
### Aliases: itemID2Params

### ** Examples

itemID2Params("BL03")



cleanEx()
nameEx("playedAngle")
### * playedAngle

flush(stderr()); flush(stdout())

### Name: playedAngle
### Title: playedAngle
### Aliases: playedAngle

### ** Examples

adrA=10
adrB=18
plotFBN()
playedAngle(adrA=adrA, adrB=adrB)



cleanEx()
nameEx("plotFBN")
### * plotFBN

flush(stderr()); flush(stdout())

### Name: plotFBN
### Title: plotFBN
### Aliases: plotFBN

### ** Examples

plotFBN(Adresses=FALSE)




cleanEx()
nameEx("readAUGMENTED")
### * readAUGMENTED

flush(stderr()); flush(stdout())

### Name: readAUGMENTED
### Title: readAUGMENTED
### Aliases: readAUGMENTED

### ** Examples

#Dateiname = "RAW-2015-04"
#head(readAUGMENTED(Dateiname = Dateiname))




cleanEx()
nameEx("readItemBank")
### * readItemBank

flush(stderr()); flush(stdout())

### Name: readItemBank
### Title: readItemBank
### Aliases: readItemBank

### ** Examples

ItemBank <- readItemBank()
head(ItemBank)



cleanEx()
nameEx("readRAW")
### * readRAW

flush(stderr()); flush(stdout())

### Name: readRAW
### Title: readRAW
### Aliases: readRAW

### ** Examples

Dateiname = "RAW-2015-04"
#head(readRAW(Dateiname = Dateiname))




### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
