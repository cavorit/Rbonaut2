#' @author Harald Fiedler
#' @description Liefert das Ergebnis eines Balls/Stimulus zurück, z.B. 0 oder 1
#' @details Liefert das Ergebnis eines Balls/Stimulus zurück, z.B. 0 oder 1. Aus dem data.frame ist nicht ersichtlich, welches für welches Modell die ItemResponse erhoben wird. Im dichotomen Rasch Modell wird das Ergebnis auf 0-1 codiert, während es für andere Modelle andere Erfassungen geben mag. Hier muss extern geklärt werden, welche ItemID welchem Modell zugeordnet ist.
#' @param Stimulus ein data.frame mit den Spalten isMulitTarg, MultiTargs, RW, AW, HW, vA, sL und sR und einer Zeile. Es handelt sich also um eine Zeile aus DF, die einen Ball darstellt
#' @return data frame mit der zusätzlichen Spate ItemResponse
#' @title detectItemResponse


detectItemResponse <- function(Stimulus){

  adrW <- Stimulus$adrW
  adrOut <- Stimulus$adrOut
  FBt <- Stimulus$FBt
  ItemID <- Stimulus$ItemID

  Stimulus$ItemResponse <- 0


  Stimulus[ItemID=="CS01" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS02" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS03" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS04" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS05" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS06" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS07" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS08" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS09" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS10" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS11" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS12" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS13" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS14" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS15" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS16" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS17" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS18" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS19" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS20" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS21" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS22" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS23" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS24" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS25" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS26" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS27" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS28" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS29" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS30" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS31" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="CS32" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1

  Stimulus[ItemID=="BL01" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL02" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL03" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL04" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL05" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL06" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL07" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL08" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL09" & FBt < 2500 & adrW == adrOut, "ItemResponse"] <- 1 #
  Stimulus[ItemID=="BL10" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL11" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL12" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL13" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL14" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL15" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL16" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL17" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL18" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL19" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL20" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL21" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL22" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL23" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL24" & FBt < 2500 & adrW == adrOut, "ItemResponse"] <- 1 #
  Stimulus[ItemID=="BL25" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL26" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL27" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL28" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL29" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL30" & FBt < 2500 & adrW == adrOut, "ItemResponse"] <- 1 #
  Stimulus[ItemID=="BL31" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1
  Stimulus[ItemID=="BL32" & FBt < 2250 & adrW == adrOut, "ItemResponse"] <- 1

  return(Stimulus)
}
