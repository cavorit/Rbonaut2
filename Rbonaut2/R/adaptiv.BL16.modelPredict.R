#' @author Harald Fiedler, Kateryna Budzyak
#' @description modelPredict() fuer yhat-Modell eines adaptiven Samplers nach 5 Bällen des BL32-Testraums mit Stop nach 16 Bällen. Basiert auf dem Skript BL32MultiTargetSimTest.r (Teilcode wurde kopiert)
#' Der Output Ergebnis wurde nach dem adaptiv.BL16.fullRandom.modelPredict.R implementiert
#' @details Es handelt sich hier um die modelPredict-Funktion für yhat-Architektur. Bei dem Dienst handelt es sich um einen reinen Item-Sampler. Solange die Session-History weniger als 16 Bälle aufweist, wird aus dem Item-Raum der BL32 ein Item gewählt.
#' Der erste Ball ist immer BL01, die nächsten 4 Bälle werden ohne Zurücklegen gezogen.
#' @param AnfrageDF data.frame mit den Spalten:
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
#' @title adaptiv.BL16.modelPredict
#' @return Ein JSON-gültiger String mit den folgenden Informationen:
#' \itemize{
#'     \item TicketID ein stochastischer Identifikator für die REST-Request, z.B. "JTMfOgfTEiq6ZMxb"
#'     \item GameOver ein boolescher Wert der angibt, ob das Abbruchkriterium für die Testung erreicht wurde
#'     \item NextB Eine liste mit Informationen über den nächsten Ball
#'     \item Testergebnis Das Testergebnis, dass der Spieler auf der latenten Kompetenzdimension erhält. (Noch nicht implementiert, daher vorläufig NA)
#'     \item Seashell_output_base64, Grafik im base64 im JSON format, wenn gameover.# Um es als html zu öffnen: <!DOCTYPE html><html><body><img src="data:;base64,Seashell_output_base64" alt="SeaShell"/></body></html>
#' }
#'

adaptiv.BL16.modelPredict <- function(AnfrageDF){

  # get ItemBank für BL32
  ItemBank_BL32 <- readItemBank()[33:64,]
  rownames(ItemBank_BL32) <- ItemBank_BL32$ItemID

#  TestID <- AnfrageDF$TestID
#  idS <- AnfrageDF$idS
#  idP <- AnfrageDF$idP
#  NamePlayer <- AnfrageDF$NamePlayer
#  Team <- AnfrageDF$Team
#  Birthday <- as.Date(AnfrageDF$Birthday)
#  SessionStart <- as.Date(AnfrageDF$SessionStart)
#  AlterInJahren <- round(as.numeric(SessionStart - Birthday, units="days") / 365, 0)

  # adrB NA, dann noch nichts vorher gespielt?
  if (sum(is.na(AnfrageDF$adrB))){# Besonderes Handling bei erster Anfrage (=leere Anfrage), nB= #Bälle in Session
    Level <- 0
    # das erste Item ist immer BL01? oder sollte auch zufällig gewählt  werden
    nxtItemID <- "BL01"
    History <- as.data.frame(NULL
       #       adrB = c(),
       #       adrW = c(),
       #       adrOut = c(),
       #       FBt = c(),
       #       ItemID = c(),
       #       ItemResponse = c(),
       #       Level = c()
    )
  }
  # jetzt die nächsten 4 zufällig
  else if (length(AnfrageDF$adrB) < 5 ){# die Bälle 2-5 zufällig
    History <- data.frame(
      adrB = AnfrageDF$adrB,
      adrW = AnfrageDF$adrW,
      adrOut = AnfrageDF$adrOut,
      FBt = AnfrageDF$FBt
    )

    # warum behält man nicht einfach die ItemID's bei?
    History$ItemID <- Rbonaut2::detectItemIDLive(adrB = History$adrB, adrW = History$adrW)
    # History <- History[History$ItemID != "unbekannt", ] # nicht nötig
    nxtItemID = sample(setdiff(ItemBank_BL32$ItemID,History$ItemID), size = 1)

  }
  # Adaptivität
  else{
    History <- data.frame(
      adrB = AnfrageDF$adrB,
      adrW = AnfrageDF$adrW,
      adrOut = AnfrageDF$adrOut,
      FBt = AnfrageDF$FBt

    )

    History$ItemID <- Rbonaut2::detectItemIDLive(adrB = History$adrB, adrW = History$adrW)
    # wann könnte es passieren, dass ItemID unbekannt ist??
    History <- History[History$ItemID != "unbekannt", ]
    # was passiert hier?  total curious, es sieht so aus als ob das ganze data.frame überschrieben wird.
    History <- Rbonaut2::detectItemResponse(Stimulus = History)


    Fiedler2016 <- NULL
    for (idX in 1:nrow(History)){# idX = 1
      nTePartialSession <- History[1:idX, ]
      Fiedler2016 <- c(Fiedler2016, catR::thetaEst(it = ItemBank_BL32[nTePartialSession$ItemID, -1], x=nTePartialSession$ItemResponse, priorDist="Jeffreys"))
    }
    History$Level <- Fiedler2016 #  thetaHat der n-ten Partial-History
    Level = tail(History$Level,1) # thetaHat zum Zeitpunkt des letzten Balls
    nxtItemID <- catR::nextItem(itemBank=ItemBank_BL32[History$ItemID, -1], theta=History$Level, out=History$ItemID, randomesque=5)$item
    nxtItemID <- rownames(ItemBank_BL32)[nxtItemID]
    rm(nTePartialSession)
    rm(idX)
    rm(Fiedler2016)


  }
  GameOver = (nrow(AnfrageDF)>16)

  nextB_Params <- Rbonaut2::itemID2Params(nxtItemID)
  Ergebnis <- list(
    # what is it?
    TicketID = paste(sample(c(letters, LETTERS), size = 20, replace =TRUE), collapse = ''),
    GameOver = GameOver,
    nextB = list(
      ballmachine = nextB_Params$adrB,
      goal_target = nextB_Params$adrW,
      speed_left = nextB_Params$sLsRvA[1],
      speed_right = nextB_Params$sLsRvA[2],
      vertical_angle = nextB_Params$sLsRvA[3],
      # shot delay immer 800 ?
      shot_delay = 800,
      # ist es das gleiche?
      expiration_time = nextB_Params$colorExpiration
      # Was ist mit color?

    ),
    # was kommt hier hin????
    Testergebnis = NA,
    # plot bei gameover, erst local
    Seashell_output_base64 = ifelse(GameOver, plotSeaShell(x=tail(History$Level,1),A=History$Level, B=NormTree[[AnfrageDF$Team[1]]]$RAW$Fiedler2016a, TitelA = AnfrageDF$NamePlayer, TitelB =AnfrageDF$Team[1], gameover=TRUE), NA)
  )

  return(jsonlite::toJSON(Ergebnis))

}










