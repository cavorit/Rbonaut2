#' @author Harald Fiedler
#' @description modelTransform() fuer yhat-Modell eines voll adaptiven Samplers des BL32-Testraums mit Stop nach 16 Bällen
#' @details Es handelt sich hier um die modelTransform-Funktion für yhat-Architektur. Bei dem Dienst handelt es sich um einen reinen Item-Sampler. Solange die Session-History weniger als 16 Bälle aufweist, wird aus dem Item-Raum der BL32 ein Item gewählt.
#' @param AnfrageJSONstring String, der in R zu einer Liste umgewandelt werden kann mit folgenden Elementen:
#' \itemize{
#'   \item TestID: den Namen des Testformats. Beispielsweise: 'BL32'
#'   \item idS: die aktuelle Session-ID, beispielsweise: '002b6573-cf12-436d-bccd-0856b0bb0a25'
#'   \item idP: die Player-ID des jeweiligen Probanden, beispielsweise: 'fe553db4-bbde-43dd-a6a0-804b9e46c57'
#'   \item NamePlayer: Klarname des Spielers, beispielsweise: 'Mustermann, Tim'
#'   \item Birthday: Geburtsdatum des Spielers, beispielsweise: '2002-07-21'
#'   \item Team: Bezeichnung des Teams, z.B. "U17"
#'   \item SessionStart: der Zeitstempel für den Sessionsstart als String im Format "JJJJ-MM-TT HH:MM:SS", beispielsweise: '2014-03-22 13:42:03'
#'   \item adrB: eine Liste mit den Adressen der Ballkanonen, in der Reihenfolge ihrer Aktivierung, beispielsweise: [10, 45, 28] oder bei Sessionstart eine leere Liste '[]'.
#'   \item adrW: eine Liste von Listen mit den aufleuchtenden Zielfeldern. Beispielsweise: '[[4, 6], [21, 22], [50, 18]]' oder bei Sessionstart '[[]]'
#'   \item adrCol: Eine Liste von Strings mit der Farbe der Zielfelder aus [[adrW]]. Die Farben werden als String aus rgb-Werten (max=255) übergeben. Das satte Blau in Farben von Hoffenheim ist rgb(1,95,169, maxColorValue=255). Farbe B ist die Gegnerfarbe rgb(200,100,0, maxColorValue=255). Beispielsweise: "[[["1,95,169"],["200,100,0"]],[["1,95,169"],["200,100,0"]],[["200,100,0"],["1,95,169"]]]" oder bei Sessionstart '[[]]'
#'   \item adrOut: eine Liste mit den Adressen, wo der Ball tatsächlich raus ist. Beispielsweise: '[4, 23, 40]' oder bei Sessionstart '[]'
#'   \item FBt: eine Liste mit den Angaben über die Zeitdauer zwischen Ballkanoneneinwurf und Lichtschrankensignal beim Rausschießen des Balls (in Millisekunden), beispielsweise: '[2140, 2600, 8600]' oder bei Sessionstart '[]'
#' }
#'
#' Hier ein Beispiel für eine gültige Anfrage für die Abfrage eines ersten Balls:
#'
#'#' testJSONrequest <- '\{\cr
#' "TestID" : "BL32",\cr
#' "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a25",\cr
#' "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",\cr
#' "NamePlayer" : "Mustermann, Tim",\cr
#' "Birthday" : "2002-07-21",\cr
#' "Team" : "U14",\cr
#' "SessionStart" : "2014-03-22 13:42:03",\cr
#' "adrB" : [],\cr
#' "adrW" : [],\cr
#' "adrCol" : [],\cr
#' "adrOut" : [],\cr
#' "FBt" : []\cr
#' \}'\cr
#'
#'
#'Für einen vierten Ball:
#'
#' testJSONrequest <- '\{\cr
#' "TestID" : "BL32",\cr
#' "idS" : "002b6573-cf12-436d-bccd-0856b0bb0a25",\cr
#' "idP" : "fe553db4-bbde-43dd-a6a0-804b9e46c57",\cr
#' "NamePlayer" : "Mustermann, Tim",\cr
#' "Birthday" : "2002-07-21",\cr
#' "Team" : "U14",\cr
#' "SessionStart" : "2014-03-22 13:42:03",\cr
#' "adrB" : [10, 45, 28],\cr
#' "adrW" : [[4, 6], [21, 22], [50, 18]],\cr
#' "adrCol" : [[["1,95,169"],["200,100,0"]],[["1,95,169"],["200,100,0"]],[["200,100,0"],["1,95,169"]]],\cr
#' "adrOut" : [4, 23, 40],\cr
#' "FBt" : [2140, 2600, 8600]\cr
#' \}'\cr
#'
#'
#' @title adaptiv.BL16.modelTransform
#' @return data.frame mit den oben beschriebenen Spalten.

adaptiv.BL16.modelTransform <- function(AnfrageJSONstring){

  AnfrageListe <- jsonlite::fromJSON(txt = AnfrageJSONstring)

  cat("################ erhaltene Daten:\n")
  for (i in 1:length(AnfrageListe)){
    cat(paste0("# ", names(AnfrageListe[i]), " (", class(AnfrageListe[[i]]), ") : " , AnfrageListe[[i]], "\n"))
  }
  cat("################ \n")

  # Lese die Variablen ein
  TestID <- AnfrageListe$TestID # Die ID dieses Tests lautet "adaptiv.BL16.fullRandom"
  idS <- AnfrageListe$idS
  idP <- AnfrageListe$idP
  NamePlayer <- AnfrageListe$NamePlayer # Name als ein CharacterString
  Birthday <- as.Date(AnfrageListe$Birthday)
  Team <- AnfrageListe$Team
  SessionStart <- as.Date(AnfrageListe$SessionStart) # Datum Stunde Sekunde
  adrB <- AnfrageListe$adrB
  adrW <- AnfrageListe$adrW
  adrCol <- AnfrageListe$adrCol
  adrOut <- AnfrageListe$adrOut
  FBt <- AnfrageListe$FBt
  print("#############")
  #handling leerer Listen (Abfrage eines ersten Balls)
  # ein leers JSON-array [] wird zu list() oder logical(0). Deren dim() ist NULL
  if(length(adrB)==0){ErsterBall <- TRUE}else{ErsterBall <- FALSE}
  if (ErsterBall){
    adrB <- NA
    adrW <- NA
    adrCol <- NA
    adrOut <- NA
    FBt <- NA
  }

  # bei Multitarget wird jeweils nur das erste Fenster genommen:
  print(adrW)
  print(class(adrW))
  #if (!ErsterBall & is.matrix(adrW)){adrW <- adrW[,1]}
  #if (!ErsterBall & is.matrix(adrCol)){adrCol <- adrCol[,1]}


  cat("######### Variablen erfasst:\n")
  cat(paste0("# TestID : ", TestID, "\n"))
  cat(paste0("# idS : ", idS, "\n"))
  cat(paste0("# idP : ", idP, "\n"))
  cat(paste0("# NamePlayer : ", NamePlayer, "\n"))
  cat(paste0("# Birthday : ", Birthday, "\n"))
  cat(paste0("# Team : ", Team, "\n"))
  cat(paste0("# SessionStart : ", SessionStart, "\n"))
  cat(paste0("# adrB : ", adrB, "\n"))
  cat(paste0("# adrW : ", adrW, "\n"))
  cat(paste0("# adrCol : ", adrCol, "\n"))
  cat(paste0("# adrOut : ", adrOut, "\n"))
  cat(paste0("# FBt : ", FBt, "\n"))
  cat("# \n")

  # Bereite Ergebnis vor
  AnfrageDF <- data.frame(
    TestID = TestID,
    idS = idS,
    idP = idP,
    NamePlayer = NamePlayer,
    Birthday = Birthday,
    Team = Team,
    SessionStart = SessionStart,
    adrB = adrB,
    adrW = adrW,
    adrCol = adrCol,
    adrOut = adrOut,
    FBt = ifelse(is.list(FBt) & length(FBt)==0, NA, FBt)
  )
  # Multitarget wird auf single target abgebildet : adrW und adrCol wird erzeugt
  if(sum(names(AnfrageDF)=="adrW.1")){
    AnfrageDF$adrW = AnfrageDF$adrW.1
  }
  if(sum(names(AnfrageDF)=="adrCol.1")){
    AnfrageDF$adrCol <- AnfrageDF$adrCol.1
  }

  cat("# übergebe data.frame an modelPredict ...\n")
  print(AnfrageDF)

  return(AnfrageDF)
}








