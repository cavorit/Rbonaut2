% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adaptiv.BL16.fullRandom.modelPredict.R
\name{adaptiv.BL16.fullRandom.modelPredict}
\alias{adaptiv.BL16.fullRandom.modelPredict}
\title{adaptiv.BL16.fullRandom.modelPredict}
\usage{
adaptiv.BL16.fullRandom.modelPredict(AnfrageDF)
}
\arguments{
\item{AnfrageDF}{data.frame mit den Spalten:
\itemize{
  \item TestID: den Namen des Testformats. Beispielsweise: 'BL32'
  \item idS: die aktuelle Session-ID, beispielsweise: '002b6573-cf12-436d-bccd-0856b0bb0a25'
  \item idP: die Player-ID des jeweiligen Probanden, beispielsweise: 'fe553db4-bbde-43dd-a6a0-804b9e46c57'
  \item NamePlayer: Klarname des Spielers, beispielsweise: 'Mustermann, Tim'
  \item Birthday: Geburtsdatum des Spielers, beispielsweise: '2002-07-17'
  \item Team: Bezeichnung des Teams, z.B. "U17"
  \item SessionStart: der Zeitstempel für den Sessionsstart als String im Format "JJJJ-MM-TT HH:MM:SS", beispielsweise: '2014-03-22 13:42:03'
  \item adrB: eine Liste mit den Adressen der Ballkanonen, in der Reihenfolge ihrer Aktivierung, beispielsweise: [10, 45, 28] oder bei Sessionstart eine leere Liste '[]'.
  \item adrW: eine Liste von Listen mit den aufleuchtenden Zielfeldern. Beispielsweise: '[[4, 6], [21, 22], [50, 18]]' oder bei Sessionstart '[[]]'
  \item adrCol: Eine Liste von Strings mit der Farbe der Zielfelder aus [[adrW]]. Die Farben werden als String aus rgb-Werten (max=255) übergeben. Das satte Blau in Farben von Hoffenheim ist rgb(1,95,169, maxColorValue=255). Farbe B ist die Gegnerfarbe rgb(200,100,0, maxColorValue=255). Beispielsweise: "[[["1,95,169"],["200,100,0"]],[["1,95,169"],["200,100,0"]],[["200,100,0"],["1,95,169"]]]" oder bei Sessionstart '[[]]'
  \item adrOut: eine Liste mit den Adressen, wo der Ball tatsächlich raus ist. Beispielsweise: '[4, 23, 40]' oder bei Sessionstart '[]'
  \item FBt: eine Liste mit den Angaben über die Zeitdauer zwischen Ballkanoneneinwurf und Lichtschrankensignal beim Rausschießen des Balls (in Millisekunden), beispielsweise: '[2140, 2600, 8600]' oder bei Sessionstart '[]'
}}
}
\value{
Ein JSON-gültiger String mit den folgenden Informationen:
\itemize{
    \item TicketID ein stochastischer Identifikator für die REST-Request, z.B. "JTMfOgfTEiq6ZMxb"
    \item GameOver ein boolescher Wert der angibt, ob das Abbruchkriterium für die Testung erreicht wurde
    \item NextB Eine liste mit Informationen über den nächsten Ball
    \itemize{
    \item ballmachine welche als nächstes aktiv ist
    \item goal_target Zielfeld
    \item speed_left Geschwindigkeit der linken Walze
    \item speed_right  Geschwindigkeit der rechten Walze
    \item vertical_angle Vertikaler Winkel der Ballmaschine
    \item shoot_delay Verzögerungszeit nach dem das Signal ertönt ist
    \item expriration_time Zeit in der das Zielfeld valid_color leuchten soll, dann mit expiration_color
    \item valid_color String für die Farbe '13,83,97'
    \item expiration_color String für die Farbe '200,100,0'
    }

    \item Testergebnis Das Testergebnis, dass der Spieler auf der latenten Kompetenzdimension erhält. (Noch nicht implementiert, daher vorläufig NA)
    \item Seashell_output_base64, Grafik im base64 im JSON format, wenn gameover. Um es im Browser zu öffnen: <!DOCTYPE html><html><body><img src="data:;base64,Seashell_output_base64" alt="SeaShell"/></body></html>
}
#' Example Output, jedes Anführungszeichen, außer erstes und letztes sind backslashed \cr
["{"TicketID":["YxubhQlCsGdrXcGnhSZo"],"nextB":{"ballmachine":[28],"goal_target":[72],"speed_left":[50],\cr
"speed_right":[60],"vertical_angle":[4],"shot_delay":[800],"expiration_time":[2195],\cr
"expiration_color":["200,100,0"]},"Testergebnis":[null],"GameOver":[false],\cr
"Seashell_output_base64":[null]}"]
}
\description{
modelPredict() fuer yhat-Modell eines voll randomisierten Samplers des BL32-Testraums mit Stop nach 16 Bällen
}
\details{
Es handelt sich hier um die modelPredict-Funktion für yhat-Architektur. Bei dem Dienst handelt es sich um einen reinen Item-Sampler. Solange die Session-History weniger als 16 Bälle aufweist, wird aus dem Item-Raum der BL32 ein Item gewählt.
}
\author{
Harald Fiedler
}

