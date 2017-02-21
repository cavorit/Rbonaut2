#' @author Harald Fiedler
#' @description Liefert die ItemID eines Balls/Stimulus zurück
#' @details Liefert die ItemID eines Balls/Stimulus zurück, z.B. "BL03". Die Funktion ist nicht vektorwertig implementiert, sondern kann immer nur eine Abfrage auf einmal durchführen
#' @param Stimulus ein data.frame mit den Spalten isMulitTarg, MultiTargs, RW, AW, HW, vA, sL und sR und einer Zeile. Es handelt sich also um eine Zeile aus DF, die einen Ball darstellt
#' @return charactger der Länge 1, z.B. c("BL03")
#' @title detectItemID


detectItemID <- function(Stimulus){

  isMultiTarg <- Stimulus$isMultiTarg
  adrWW <- Stimulus$adrWW
  RW <- Stimulus$RW
  if (is.na(RW)){RW<-Inf} # RW=NA macht zu viele Probleme
  AW <- Stimulus$AW
  HW <- Stimulus$HW
  vA <- Stimulus$vA
  sL <- Stimulus$sL
  sR <- Stimulus$sR

  # BaseLine (neu)
  if (!isMultiTarg & RW == Inf   & AW ==  20   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL01")
  if (!isMultiTarg & RW == 160   & AW ==-140   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL02")
  if (!isMultiTarg & RW ==  50   & AW ==  60   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL03")
  if (!isMultiTarg & RW == 120   & AW == -50   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL04")
  if (!isMultiTarg & RW == 140   & AW == -50   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL05")
  if (!isMultiTarg & RW ==-130   & AW ==-170   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL06")
  if (!isMultiTarg & RW ==  80   & AW == -30   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL07")
  if (!isMultiTarg & RW ==-150   & AW ==-140   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL08")
  if (!isMultiTarg & RW ==-130   & AW ==  30   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL09")#
  if (!isMultiTarg & RW ==-120   & AW ==  30   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL10")
  if (!isMultiTarg & RW == 150   & AW ==-120   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL11")
  if (!isMultiTarg & RW ==  30   & AW ==-120   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL12")
  if (!isMultiTarg & RW ==-150   & AW == -10   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL13")
  if (!isMultiTarg & RW == -80   & AW ==-160   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL14")
  if (!isMultiTarg & RW ==  70   & AW ==-160   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL15")
  if (!isMultiTarg & RW ==  70   & AW == -80   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL16")
  if (!isMultiTarg & RW ==-100   & AW ==-170   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL17")
  if (!isMultiTarg & RW ==-100   & AW == 70    & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL18")
  if (!isMultiTarg & RW == -70   & AW ==-170   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL19")
  if (!isMultiTarg & RW == -10   & AW == -60   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL20")
  if (!isMultiTarg & RW == 150   & AW ==170    & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL21")
  if (!isMultiTarg & RW == 100   & AW ==-40    & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL22")
  if (!isMultiTarg & RW == -50   & AW ==160    & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL23")
  if (!isMultiTarg & RW == -70   & AW ==160    & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL24")#
  if (!isMultiTarg & RW == 110   & AW == 80    & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL25")
  if (!isMultiTarg & RW == 100   & AW == -110  & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL26")
  if (!isMultiTarg & RW == -70   & AW == -60   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL27")
  if (!isMultiTarg & RW == -30   & AW == -40   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL28")
  if (!isMultiTarg & RW == 130   & AW == 110   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL29")
  if (!isMultiTarg & RW ==  70   & AW == -40   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL30")
  if (!isMultiTarg & RW == 130   & AW == -100  & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL31")#
  if (!isMultiTarg & RW ==-170   & AW == -40   & HW == "FF" & vA == 2 & (abs(sL-50)<35) & (abs(sR-50)<35)) return("BL32")

  # CS32
  if (!isMultiTarg & Inf         & AW ==   20   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS01")
  if (!isMultiTarg & RW == 160   & AW == -140   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS02")
  if (!isMultiTarg & RW ==  50   & AW ==   60   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS03")
  if (!isMultiTarg & RW == 120   & AW ==  -50   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS04")
  if (!isMultiTarg & RW == 140   & AW ==  -50   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS05")
  if (!isMultiTarg & RW ==-130   & AW == -170   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS06")
  if (!isMultiTarg & RW ==  80   & AW ==  -30   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS07")
  if (!isMultiTarg & RW ==-150   & AW == -140   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS08")
  if (!isMultiTarg & RW ==-130   & AW ==   30   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS09")
  if (!isMultiTarg & RW ==-120   & AW ==   30   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS10")
  if (!isMultiTarg & RW == 150   & AW == -120   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS11")
  if (!isMultiTarg & RW ==  30   & AW == -120   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS12")
  if (!isMultiTarg & RW ==-150   & AW ==  -10   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS13")
  if (!isMultiTarg & RW == -80   & AW == -160   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS14")
  if (!isMultiTarg & RW ==  70   & AW == -160   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS15")
  if (!isMultiTarg & RW ==  70   & AW ==  -80   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS16")
  if (!isMultiTarg & RW ==-100   & AW == -170   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS17")
  if (!isMultiTarg & RW ==-100   & AW ==   70   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS18")
  if (!isMultiTarg & RW == -70   & AW == -170   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS19")
  if (!isMultiTarg & RW == -10   & AW ==  -60   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS20")
  if (!isMultiTarg & RW == 150   & AW ==  170   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS21")
  if (!isMultiTarg & RW == 100   & AW ==  -40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS22")
  if (!isMultiTarg & RW == -50   & AW ==  160   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS23")
  if (!isMultiTarg & RW == -70   & AW ==  160   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS24")
  if (!isMultiTarg & RW == 110   & AW ==   80   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS25")
  if (!isMultiTarg & RW == 100   & AW == -110   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS26")
  if (!isMultiTarg & RW == -70   & AW ==  -60   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS27")
  if (!isMultiTarg & RW == -30   & AW ==  -40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS28")
  if (!isMultiTarg & RW == 130   & AW ==  110   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS29")
  if (!isMultiTarg & RW ==  70   & AW ==  -40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS30")
  if (!isMultiTarg & RW == 130   & AW == -100   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS32")
  if (!isMultiTarg & RW ==-170   & AW ==  -40   & HW == "FF" & vA == 2 & (abs(sL-55)<15) & (abs(sR-65)<25)) return("CS32")

  return("unbekannt")
}
