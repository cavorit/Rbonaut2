pkgname <- "Rbonaut2"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('Rbonaut2')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("SQL2DF")
### * SQL2DF

flush(stderr()); flush(stdout())

### Name: SQL2DF
### Title: SQL2DF
### Aliases: SQL2DF

### ** Examples

message("Ich lade den R-Paket-internen RAW-Datensatz: Footbonaut_Datenabfrage_RicoWehrle.csv")
Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
SQL <- read.csv2(file=Pfad, sep = ",", stringsAsFactors = FALSE, encoding = "utf8")
DF <- SQL2DF(SQL=SQL)
head(DF)



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
nameEx("getItemICC")
### * getItemICC

flush(stderr()); flush(stdout())

### Name: getItemICC
### Title: getItemICC
### Aliases: getItemICC

### ** Examples

Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
DF <- SQL2DF(SQL = SQL)
ItemBank=readItemBank()
F14 <- getItemICC(DF=DF, ItemBank=readItemBank(), MaximaleToleranz=15)
head(F14)



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
gibZahlfuehrendeNull(k=k, digits=9)



cleanEx()
nameEx("isUTF8")
### * isUTF8

flush(stderr()); flush(stdout())

### Name: isUTF8
### Title: isUTF8
### Aliases: isUTF8

### ** Examples

isUTF8(file="~/Desktop")



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
nameEx("readItemBank")
### * readItemBank

flush(stderr()); flush(stdout())

### Name: readItemBank
### Title: readItemBank
### Aliases: readItemBank

### ** Examples

ItemBank <- readItemBank()
head(ItemBank)



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
