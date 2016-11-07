#' @author Harald Fiedler
#' @description das yhat-modelTransform() fuer einen randomisierten BL32-Test
#' @details Es handelt sich hier um einen reinen Item-Sampler über den BL32-Item-Raum, der nach 16 Bällen abbricht.
#' @param AnfrageJSON String, der in R zu einer Liste umgewandelt werden kann mit folgenden Elementen: 
#' #\itemize{
#'   #\item TestID: den Namen des Testformats. Beispielsweise: 'BL32'
#'   #\item idS: die aktuelle Session-ID, beispielsweise: '002b6573-cf12-436d-bccd-0856b0bb0a25'
#'   #\item idP: die Player-ID des jeweiligen Probanden, beispielsweise: 'fe553db4-bbde-43dd-a6a0-804b9e46c57'
#'   #\item NamePlayer: Klarname des Spielers, beispielsweise: 'Mustermann, Tim'
#'   #\item SessionStart: der Zeitstempel für den Sessionsstart als String im Format "JJJJ-MM-TT HH:MM:SS", beispielsweise: '2014-03-22 13:42:03'
#'   #\item adrB: eine Liste mit den Adressen der Ballkanonen, in der Reihenfolge ihrer Aktivierung, beispielsweise: [10, 45, 28] oder bei Sessionstart eine leere Liste.
#'   #\item adrW: eine Liste von Listen mit den aufleuchtenden Zielfeldern. Beispielsweise: '[[4, 6], [21, 22], [50, 18]]' oder bei Sessionstart '[[]]'
#'   #\item adrCol: eine Liste von Listen mit der Farbe der Zielfelder aus [[adrW]]. Die Farben werden alphabetisch in Großbuchstaben durchnummeriert. Beispielsweise: "[['A', 'B'], ['A', 'B'], ['B', 'A']]" oder bei Sessionstart '[[]]'
#'   #\item '[adrOut]' eine Liste mit den Adressen, wo der Ball tatsächlich raus ist. Beispielsweise: [4, 23, 40] oder bei Sessionstart []
#'   #\item [FBt] eine Liste mit den Angaben über die Zeitdauer zwischen Ballkanoneneinwurf und Lichtschrankensignal beim Rausschießen des Balls (in Millisekunden), beispielsweise: "[2140, 2600, 8600]" oder bei Sessionstart "[]"
#' } 
#' @return list
#' @title adaptiv.BL16.fullRandom.modelTransform

adaptiv.BL16.fullRandom.modelTransform <- function(AnfrageJSON){
    
    AnfrageListe <- jsonlite::fromJSON(txt = AnfrageJSONstring)
    
    # Lese die Variablen ein
    TestID <- AnfrageListe$TestID # Die ID dieses Tests lautet "adaptiv.BL16.fullRandom" 
    idS <- AnfrageListe$idS # ID der Session
    NamePlayer <- AnfrageListe$NamePlayer # Name als ein CharacterString
    SessionStart <- as.Date(AnfrageListe$SessionStart) # Datum Stunde Sekunde 
    adrB <- AnfrageListe$adrB 
    adrW <- AnfrageListe$adrW
    adrCol <- AnfrageListe$adrCol
    adrOut <- AnfrageListe$adrOut
    FBt <- AnfrageListe$FBt
    
    # Identifiziere die Items
    # Rbonaut2::detectItemID(Stimulus = )
    
    
    return(AnfrageListe)
    
  }
}





 


