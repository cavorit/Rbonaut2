#' @author Kateryna Budzyak
#' @description Vergleicht Aktionswinkel zwischen adrB und adrW um den gespielten Ball bei der Adaptiviät zu berücksichtigen
#' @details Falls ein Ball gespielt wurde, der nicht in der ItemBank vorhanden ist, werden die Aktionswinkel verglichen um den gespielten Ball bei der Adaptiviät zu berücksichtigen
#' @param playedballs data.frame, required fields
#' \itemize{
#'   \item adrA numeric Adressen der Ausgangsfelder
#'   \item adrB numeric Adressen der Zielfelder
#' }
#'
#' @title detectRotateditems
#' @return Vektor mit identifiezierten ItemID's
#' @examples
#' playedballs <-  structure(list(adrB = c(10L, 45L), adrW = c(12L, 10L), adrOut = c(4L, 23L),
#'    FBt = c(2140L, 2140L), ItemID = c("unbekannt", "unbekannt")),
#'    .Names = c("adrB", "adrW", "adrOut", "FBt", "ItemID"), row.names = 1:2, class = "data.frame")
#' detectRotatedItems(playedballs=playedballs)
detectRotatedItems  <- function(playedballs){

  Items_with_angle <- structure(list(ItemID = structure(1:32, .Label = c("BL01", "BL02",
                                                                         "BL03", "BL04", "BL05", "BL06", "BL07", "BL08", "BL09", "BL10",
                                                                         "BL11", "BL12", "BL13", "BL14", "BL15", "BL16", "BL17", "BL18",
                                                                         "BL19", "BL20", "BL21", "BL22", "BL23", "BL24", "BL25", "BL26",
                                                                         "BL27", "BL28", "BL29", "BL30", "BL31", "BL32"), class = "factor"),
                                     adrM = c(64L, 28L, 10L, 46L, 64L, 28L, 10L, 46L, 64L, 46L,
                                              10L, 64L, 10L, 64L, 46L, 28L, 64L, 10L, 10L, 46L, 64L, 46L,
                                              28L, 46L, 28L, 64L, 28L, 10L, 28L, 64L, 10L, 28L),
                                     adrW = c(68L, 72L, 22L, 36L, 54L, 66L, 4L, 18L, 70L, 52L, 58L, 40L, 8L,
                                              32L, 14L, 12L, 30L, 24L, 48L, 34L, 26L, 38L, 60L, 6L, 44L,
                                              42L, 16L, 2L, 50L, 56L, 62L, 20L),
                                     angle = c(20, -140, 60,  -50, -50, -170, -30, -140, 30, 30, -120, -120, -10, -160,
                                               -160, -80, -170, 70, -170, -60, 170, -40, 160, 160, 80, -110,
                                               -60, -40, 110, -40, -100, -40)), .Names = c("ItemID", "adrM",   "adrW", "angle"),
                                row.names = c(NA, -32L), class = "data.frame")

  ball_angle <- playedAngle(playedballs['adrB'], playedballs['adrW'])
  comparing_angles <- lapply(ball_angle, '==', Items_with_angle$angle )
  rotated_item <- NULL
  for (comp in comparing_angles){
    if(sum(comp)){
      # wenn einem Ball mehrere Items zugeordnet werden können, wird einer zufällig ausgewählt (uniform)
      rotated_item <- c(rotated_item,as.character(sample(Items_with_angle[Items_with_angle$angle[comp]==Items_with_angle$angle,]$ItemID, 1)))

    }
  else{
    rotated_item <- c(rotated_item,'unbekannt')
  }
  }
  return(rotated_item)

  #print(ball)
}

