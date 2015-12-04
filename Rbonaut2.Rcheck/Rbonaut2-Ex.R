pkgname <- "Rbonaut2"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('Rbonaut2')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
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
nameEx("istFormatNachnameKommaVorname")
### * istFormatNachnameKommaVorname

flush(stderr()); flush(stdout())

### Name: istFormatNachnameKommaVorname
### Title: istFormatNachnameKommaVorname
### Aliases: istFormatNachnameKommaVorname

### ** Examples

Spielername <- c("Fiedler, Harald", "Mayer, Jan", "A-Team")
istFormatNachnameKommaVorname(Spielername = Spielername)



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
