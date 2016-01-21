#' @author Harald Fiedler
#' @description Liefert die ItemID eines Balls/Stimulus zurück
#' @details Liefert die ItemID eines Balls/Stimulus zurück, z.B. "BL03". Die Funktion ist nicht vektorwertig implementiert, sondern kann immer nur eine Abfrage auf einmal durchführen
#' @param Stimulus ein data.frame mit den Spalten isMulitTarg, MultiTargs, RW, AW, HW, vA, sL und sR und einer Zeile. Es handelt sich also um eine Zeile aus DF, die einen Ball darstellt
#' @return charactger der Länge 1, z.B. c("BL03")
#' @title detectItemID


detectItemID <- function(Stimulus){

  isMultiTarg <- Stimulus$isMultiTarg
  MultiTargs <- Stimulus$MultiTargs
  RW <- Stimulus$RW
  AW <- Stimulus$AW
  HW <- Stimulus$HW
  vA <- Stimulus$vA
  sL <- Stimulus$sL
  sR <- Stimulus$sR

  # BaseLine (neu)
  if (!isMultiTarg & is.na(RW)     & AW == 20   & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL01"))
  if (!isMultiTarg & RW ==  -160   & AW == 220  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL02"))
  if (!isMultiTarg & RW ==  -50    & AW == 60   & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL03"))
  if (!isMultiTarg & RW ==  -120   & AW == -50  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL04"))
  if (!isMultiTarg & RW ==  -140   & AW == -50  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL05"))
  if (!isMultiTarg & RW ==  130    & AW == 190  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL06"))
  if (!isMultiTarg & RW ==  -80    & AW == -30  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL07"))
  if (!isMultiTarg & RW ==  150    & AW == -140 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL08"))
  if (!isMultiTarg & RW ==  130    & AW == 30   & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL09"))
  if (!isMultiTarg & RW ==  120    & AW == 30   & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL10"))
  if (!isMultiTarg & RW ==  -150   & AW == 240  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL11"))
  if (!isMultiTarg & RW ==  -30    & AW == -120 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL12"))
  if (!isMultiTarg & RW ==  150    & AW == -10  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL13"))
  if (!isMultiTarg & RW ==  80     & AW == -160 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL14"))
  if (!isMultiTarg & RW ==  -70    & AW == -160 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL15"))
  if (!isMultiTarg & RW ==  -70    & AW == -80  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL16"))
  if (!isMultiTarg & RW ==  100    & AW == -170 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL17"))
  if (!isMultiTarg & RW ==  100    & AW == 70   & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL18"))
  if (!isMultiTarg & RW ==  70     & AW == 190  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL19"))
  if (!isMultiTarg & RW ==  10     & AW == -60  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL20"))
  if (!isMultiTarg & RW ==  -150   & AW == -190 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL21"))
  if (!isMultiTarg & RW ==  -100   & AW == -40  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL22"))
  if (!isMultiTarg & RW ==  50     & AW == 160  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL23"))
  if (!isMultiTarg & RW ==  70     & AW == -200 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL24"))
  if (!isMultiTarg & RW ==  -110   & AW == 80   & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL25"))
  if (!isMultiTarg & RW ==  -100   & AW == -110 & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL26"))
  if (!isMultiTarg & RW ==  70     & AW == -60  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL27"))
  if (!isMultiTarg & RW ==  30     & AW == -40  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL28"))
  if (!isMultiTarg & RW ==  -130   & AW == 110  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL29"))
  if (!isMultiTarg & RW ==  -70    & AW == -40  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL30"))
  if (!isMultiTarg & RW ==  -130   & AW == 260  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL31"))
  if (!isMultiTarg & RW ==  170    & AW == -40  & HW == "FF" & vA == 2 & (abs(sL-50)<15) & (abs(sR-50)<15)) return(c("ItemID"="BL32"))

  # CS32
  if (!isMultiTarg & is.na(RW)     & AW == 20   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS01"))
  if (!isMultiTarg & RW == -160    & AW == 140  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS02"))
  if (!isMultiTarg & RW == 40      & AW == 50   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS03"))
  if (!isMultiTarg & RW == -140    & AW == -60  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS04"))
  if (!isMultiTarg & RW == 150     & AW == -30  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS05"))
  if (!isMultiTarg & RW == 30      & AW == 40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS06"))
  if (!isMultiTarg & RW == -40     & AW == 120  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS07"))
  if (!isMultiTarg & RW == 150     & AW == 120  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS08"))
  if (!isMultiTarg & RW == 150     & AW == 170  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS09"))
  if (!isMultiTarg & RW == 100     & AW == 50   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS10"))
  if (!isMultiTarg & RW == -140    & AW == 110  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS11"))
  if (!isMultiTarg & RW == -110    & AW == 160  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS12"))
  if (!isMultiTarg & RW == -70     & AW == 160  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS13"))
  if (!isMultiTarg & RW == -70     & AW == 80   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS14"))
  if (!isMultiTarg & RW == 10      & AW == 30   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS15"))
  if (!isMultiTarg & RW == 60      & AW == 170  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS16"))
  if (!isMultiTarg & RW == 100     & AW == -70  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS17"))
  if (!isMultiTarg & RW == 70      & AW == 170  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS18"))
  if (!isMultiTarg & RW == 10      & AW == -30  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS19"))
  if (!isMultiTarg & RW == 30      & AW == 60   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS20"))
  if (!isMultiTarg & RW == -150    & AW == -170 & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS21"))
  if (!isMultiTarg & RW == -100    & AW == 40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS22"))
  if (!isMultiTarg & RW == 50      & AW == -160 & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS23"))
  if (!isMultiTarg & RW == 70      & AW == 140  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS24"))
  if (!isMultiTarg & RW == -140    & AW == -160 & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS25"))
  if (!isMultiTarg & RW == -110    & AW == -80  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS26"))
  if (!isMultiTarg & RW == 80      & AW == 60   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS27"))
  if (!isMultiTarg & RW == 30      & AW == 40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS28"))
  if (!isMultiTarg & RW == -130    & AW == -110 & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS29"))
  if (!isMultiTarg & RW == -160    & AW == 10   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS30"))
  if (!isMultiTarg & RW == -10     & AW == 100  & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS31"))
  if (!isMultiTarg & RW == 170     & AW == 40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return(c("ItemID"="CS32"))

  return("unbekannt")
}
