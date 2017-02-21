#' @author Harald Fiedler, Kateryna Budzyak
#' @description modelPredict() fuer yhat-Modell eines adaptiven Samplers nach 5 Bällen des BL32-Testraums mit Stop nach 16 Bällen. Basiert auf dem Skript BL32MultiTargetSimTest.r (Teilcode wurde kopiert)
#' Der Output Ergebnis wurde nach dem adaptiv.BL16.fullRandom.modelPredict.R implementiert
#' @details Es handelt sich hier um die modelPredict-Funktion für yhat-Architektur. Bei dem Dienst handelt es sich um einen reinen Item-Sampler. Solange die Session-History weniger als 16 Bälle aufweist, wird aus dem Item-Raum der BL32 ein Item gewählt.
#' Der erste Ball ist immer BL01 (adrB: 64, adrW: 68), die nächsten 4 Bälle werden ohne Zurücklegen gezogen. Falls ein Ball gespielt wird, der nicht in der ItemBank
#' vorhanden ist, wird überprüft ob dieser auf ein anderes Item abgebildet werden kann durch Rotation.
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
#'   \item adrCol: Eine Liste von Strings mit der Farbe der Zielfelder aus [[adrW]]. Die Farben werden als String aus rgb-Werten (max=255) übergeben. Das satte Blau in Farben von Hoffenheim ist rgb(1,95,169, maxColorValue=255). Farbe B ist die Gegnerfarbe rgb(200,100,0, maxColorValue=255). Beispielsweise: "[[["1,95,169"],["200,100,0"]],[["1,95,169"],["200,100,0"]],[["200,100,0"],["1,95,169"]]]" oder bei Sessionstart '[[]]'
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
#'     \itemize{
#'     \item ballmachine welche als nächstes aktiv ist
#'     \item goal_target Zielfeld
#'     \item speed_left Geschwindigkeit der linken Walze
#'     \item speed_right  Geschwindigkeit der rechten Walze
#'     \item vertical_angle Vertikaler Winkel der Ballmaschine
#'     \item shoot_delay Verzögerungszeit nach dem das Signal ertönt ist
#'     \item expriration_time Zeit in der das Zielfeld valid_color leuchten soll, dann mit expiration_color
#'     \item valid_color String für die Farbe '13,83,97'
#'     \item expiration_color String für die Farbe '200,100,0'
#'
#'     }
#'
#'     \item Testergebnis Das Testergebnis, dass der Spieler auf der latenten Kompetenzdimension erhält. (Noch nicht implementiert, daher vorläufig NA)
#'     \item Seashell_output_base64, Grafik im base64 im JSON format, wenn gameover. Um es im Browser zu öffnen: <!DOCTYPE html><html><body><img src="data:;base64,Seashell_output_base64" alt="SeaShell"/></body></html>
#' }
#' Example Output, jedes Anführungszeichen, außer erstes und letztes sind backslashed \cr
#' ["{"TicketID":["YxubhQlCsGdrXcGnhSZo"],"nextB":{"ballmachine":[28],"goal_target":[72],"speed_left":[50],\cr
#' "speed_right":[60],"vertical_angle":[4],"shot_delay":[800],"expiration_time":[2195],\cr
#' "expiration_color":["200,100,0"]},"Testergebnis":[null],"GameOver":[false],\cr
#' "Seashell_output_base64":[null]}"]


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

    History$ItemID <- Rbonaut2::detectItemIDLive(adrB = History$adrB, adrW = History$adrW)
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


    ## Falls ItemID unbekannt ist, wird geprüft ob der gespielte Ball im Footbonaut rotiert auf ein anderes Item
    ## abgebildet werden kann
    not_identified_balls <- History[History$ItemID == "unbekannt", ]

    # Unbekannte Items durch Rotation finden
    if(nrow(not_identified_balls)!=0){
      not_identified_balls$ItemID<-detectRotatedItems(not_identified_balls)
      not_identified_balls <- not_identified_balls[not_identified_balls$ItemID != "unbekannt",]
    }

    # lösche falls noch unbekannte Bälle vorhanden sind, raus
    History <- History[History$ItemID != "unbekannt", ]

    # füge die History wieder zusammen
    History <- rbind(History, not_identified_balls)
    if(nrow(History)==0){
      stop('Footbonaut meldet ausschließlich nicht indizierbare Items!')
    }
    # ermittle ob adrW == adrOut
    History <- Rbonaut2::detectItemResponse(Stimulus = History)

    # Wenn keine der Bälle identifierbar sind
    if(nrow(History)==0){
      stop('Footbonaut meldet ausschließlich nicht indizierbare Items!')
    }
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
  GameOver = (nrow(AnfrageDF)>=16)

  nextB_Params <- Rbonaut2::itemID2Params(nxtItemID)
  Ergebnis <- list(

    TicketID = paste(sample(c(letters, LETTERS), size = 20, replace =TRUE), collapse = ''),

    nextB = list(
      ballmachine = nextB_Params$adrB,
      goal_target = nextB_Params$adrW,
      speed_left = nextB_Params$sLsRvA[1],
      speed_right = nextB_Params$sLsRvA[2],
      vertical_angle = nextB_Params$sLsRvA[3],
      shot_delay = 800,
      expiration_time = nextB_Params$colorExpiration,
      expiration_color = '200,100,0'
    ),
    Testergebnis = NA,
    GameOver = GameOver,
    # plot bei gameover, erst local
    Seashell_output_base64 = ifelse(GameOver, plotSeaShell(x=tail(History$Level,1),A=History$Level, B=NormTree[[AnfrageDF$Team[1]]]$RAW$Fiedler2016a, TitelA = AnfrageDF$NamePlayer, TitelB =AnfrageDF$Team[1], gameover=TRUE), NA)
  )

  return(jsonlite::toJSON(Ergebnis))
  #
}










