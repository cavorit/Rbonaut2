#' @author Harald Fiedler
#' @description modelPredict() fuer yhat-Modell eines voll randomisierten Samplers des BL32-Testraums mit Stop nach 16 Bällen
#' @details Es handelt sich hier um die modelPredict-Funktion für yhat-Architektur. Bei dem Dienst handelt es sich um einen reinen Item-Sampler. Solange die Session-History weniger als 16 Bälle aufweist, wird aus dem Item-Raum der BL32 ein Item gewählt.
#' @param DF data.frame mit den Spalten:
#' \itemize{
#'   \item TestID: den Namen des Testformats. Beispielsweise: 'BL32'
#'   \item idS: die aktuelle Session-ID, beispielsweise: '002b6573-cf12-436d-bccd-0856b0bb0a25'
#'   \item idP: die Player-ID des jeweiligen Probanden, beispielsweise: 'fe553db4-bbde-43dd-a6a0-804b9e46c57'
#'   \item NamePlayer: Klarname des Spielers, beispielsweise: 'Mustermann, Tim'
#'   \item Birthday: Geburtsdatum des Spielers, beispielsweise: '2002-07-17'
#'   \item Team: Bezeichnung des Teams, z.B. "U17"
#'   \item SessionStart: der Zeitstempel für den Sessionsstart als String im Format "JJJJ-MM-TT HH:MM:SS", beispielsweise: '2014-03-22 13:42:03'
#'   \item adrB: eine Liste mit den Adressen der Ballkanonen, in der Reihenfolge ihrer Aktivierung, beispielsweise: [10, 45, 28] oder bei Sessionstart eine leere Liste '[]'.
#'   \item adrW: eine Liste von Listen mit den aufleuchtenden Zielfeldern. Beispielsweise: '[[4, 6], [21, 22], [50, 18]]' oder bei Sessionstart '[[]]'
#'   \item adrCol: eine Liste von Listen mit der Farbe der Zielfelder aus [[adrW]]. Die Farben werden alphabetisch in Großbuchstaben durchnummeriert. Beispielsweise: "[['A', 'B'], ['A', 'B'], ['B', 'A']]" oder bei Sessionstart '[[]]'
#'   \item adrOut: eine Liste mit den Adressen, wo der Ball tatsächlich raus ist. Beispielsweise: '[4, 23, 40]' oder bei Sessionstart '[]'
#'   \item FBt: eine Liste mit den Angaben über die Zeitdauer zwischen Ballkanoneneinwurf und Lichtschrankensignal beim Rausschießen des Balls (in Millisekunden), beispielsweise: '[2140, 2600, 8600]' oder bei Sessionstart '[]'
#' }
#'
#' @title adaptiv.BL16.fullRandom.modelPredict
#' @return Ein JSON-gültiger String mit den folgenden Informationen:
#' \itemize{
#'     \item TicketID ein stochastischer Identifikator für die REST-Request, z.B. "JTMfOgfTEiq6ZMxb"
#'     \item GameOver ein boolescher Wert der angibt, ob das Abbruchkriterium für die Testung erreicht wurde
#'     \item NextB Eine liste mit Informationen über den nächsten Ball
#'     \item Testergebnis Das Testergebnis, dass der Spieler auf der latenten Kompetenzdimension erhält. (Noch nicht implementiert, daher vorläufig NA)
#' }
#'

adaptiv.BL16.fullRandom.modelPredict <- function(AnfrageDF){

  ############## FullRandom aus Item-Grundgesamtheit
  # Ballkanonen <- c(9, 10, 27, 28, 45, 46, 63, 64)
  # Fenster <- setdiff(1:72, Ballkanonen)
  #
  # nextB <- list(
  #   adrB = sample(Ballkanonen, size = 1),
  #   sLsRvA = c(50, 60, 4),
  #   adrW = sample(Fenster, size=3),
  #   adrCol = c("A", sample(c("A", "B"), size=2)),
  #   Expiration = 1500 + rpois(n = 3, lambda = 1000)
  # )
  #

  ############## FullRandom aus BL32-Items
  ItemRaum <- data.frame(
    # paste0("c(",paste(BT32[1:32,c("adrM")], collapse=","), ")")
    ballmachine = c(64,28,64,10,64,64,64,10,28,46,64,64,46,28,10,64,10,10,46,46,64,46,28,46,46,28,28,10,28,10,10,28),
    # paste0("c(",paste(BT32[1:32,c("adrW")], collapse=","), ")")
    goal_target = c(68,72,54,22,70,56,40,58,66,36,42,32,14,12,4,30,24,48,52,34,26,38,60,18,6,44,16,2,50,8,62,20),
    speed_left = rep(65, times=32),
    speed_right = rep(55, times=32),
    vertical_angle = rep(2, times=32),
    shot_delay = rep(800, times=32),
    expiration_time = 2100 + rpois(32, lambda = 95)
  )
  rownames(OutputRaum) <- paste0("I", 1:32)



  Ergebnis <- list(
     TicketID = paste(sample(c(letters, LETTERS), size = 20, replace =TRUE), collapse = ''),
     GameOver = (nrow(AnfrageDF)>16),
     NextB = as.list(ItemRaum[sample(1:nrow(ItemRaum), size = 1),]), # hier wird das Item zufällig aus BL32 gewählt
     Testergebnis = NA
   )

  return(jsonlite::toJSON(Ergebnis))

}







