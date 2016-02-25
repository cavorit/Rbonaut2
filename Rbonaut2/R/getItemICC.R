#' @author Harald Fiedler
#' @description Fügt die Spalten ItemID, ICCa, ICCb, ICCc, ICCd
#' @details Aus einem DF (erzeugt mittels augment(SQL = SQL)) und der ItemBank wird ein Merge erzeugt. Dabei nutze ich AW, RW, HW und vA als Key. In einem zweiten Schritt wird die Identifikation der Items gelöscht, wenn zwischen dem tstsächlichen sL bzw. sR und dem in der ItemBank hinterlegten sL und sR eine zu große Diskrepanz entsteht.
#' @title getItemICC
#' @param DF data.frame Mittels SQL2DF(SQL=SQL) erzeugt wird
#' @param ItemBank data.frame Wird etwa durch ItemBank=readItemBank() gewonnen
#' @param MaximaleToleranz numeric der Länge 1, gibt an, wie viel sL.x von sL.y bzw. sR.x von sR.y abweichen darf, damit das Item in DF identifiziert wird mit dem Item aus der Itembank. Dabei stammt *.x aus DF und *.y aus der ItemBank. Default ist 10.
#' @return DF wird um die Spalten ItemID, ICCa, ICCb, ICCc und ICCd angereichert.
#' @examples
#' Pfad <- system.file("extdata", package="Rbonaut2", "Footbonaut_Datenabfrage_RicoWehrle.csv")
#' SQL <- read.csv(file=Pfad, sep=";", header=TRUE, encoding="utf8", stringsAsFactors = FALSE)
#' DF <- SQL2DF(SQL = SQL)
#' ItemBank=readItemBank()
#' F14 <- getItemICC(DF=DF, ItemBank=readItemBank(), MaximaleToleranz=15)
#' head(F14)


# Nach dem Umbau von SQL2DF() (=Copy&Paste-Abfragen) zu Datenbankabfragen per augmentRAW() kann es sein, dass diese Funktion nicht mehr fehlerfrei läuft.

getItemICC <- function(DF, ItemBank, MaximaleToleranz = 10){
  M <- merge(x=DF, y=ItemBank, all.x=TRUE, by=c("AW", "RW", "HW", "vA")) # dieser Merge ignoriert sL und sR

  # ungetestetes Fehler-Handling
  if(is.element("ItemID.y", colnames(M))){
    warning("Ein bereits identifiziertes Item wurde erneut identifiziert. Alte ItemID und ItemCC wird durch neue ItemID und neue ICC überschrieben.")
    M$ItemID <- M$ItemID.y
    M$a <- M$a.y
    M$b <- M$b.y
    M$c <- M$c.y
    M$d <- M$d.y
  }

  # die Item-ID und Item-ICC des harten Merge werden mit NA überschrieben, falls weiche Kriterien sL und sR zu
  # weich sind
  # cond = TRUE Item ist zu Recht identifiziert
  cond0 <- !is.na(M$sL.y) # cond0=TRUE, wenn das Item identifiziert wurde und *.y somit sinnvolle Werte enthält
  cond1 <- (abs(M$sL.x - M$sL.y) < MaximaleToleranz) # sL weicht zu stark von der ItemBank ab -> Item-Identifikation rückgängig machen
  cond2 <- (abs(M$sR.y - M$sR.y) < MaximaleToleranz) # sR weichtzu stark von der ItemBank ab -> Item-Identifikation rückgängig machen
  cond <- cond0 & cond1 & cond2
  message("Es wurden ", sum(cond0), " potentielle Items identifiziert.\n")
  message("Davon wurden ", sum(!(cond1 & cond2), na.rm = TRUE), " Identifikationen auf Grund zu stark abweichender sL bzw. sR zurückgenommen.")
  #print(head(M))
  M[!cond, c("ItemID", "sL.y", "sR.y", "ICCa", "ICCb", "ICCc", "ICCd")] <- NA

  # nun in M noch sL.x und sR.x in sL und sR umbenennen
  names(M)[names(M)=="sL.x"] <- "sL"
  names(M)[names(M)=="sR.x"] <- "sR"
  #Erg <- M[, c(names(DF), "ItemID")] # getItemID()
  Erg <- M[, c(names(DF), "ItemID", "ICCa", "ICCb", "ICCc", "ICCd")] # getItemICC()
  return(Erg)
}
