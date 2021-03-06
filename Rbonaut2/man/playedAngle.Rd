% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/playedAngle.R
\name{playedAngle}
\alias{playedAngle}
\title{playedAngle}
\usage{
playedAngle(adrA, adrB)
}
\arguments{
\item{adrA}{numeric Adressen der Ausgangsfelder}

\item{adrB}{numeric Adressen der Zielfelder}
}
\value{
numeric mit Winkel aus -170:180 wobei der Winkel positiv im Uhrzeigersinn gemessen wird
}
\description{
Winkel zwischen zwei Adressen.
}
\details{
Gibt den Winkel zwischen zwei FBN-Adressen
}
\examples{
adrA=10
adrB=18
plotFBN()
playedAngle(adrA=adrA, adrB=adrB)
}
\author{
Harald Fiedler
}

