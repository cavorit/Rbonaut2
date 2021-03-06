% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readItemBank.R
\name{readItemBank}
\alias{readItemBank}
\title{readItemBank}
\usage{
readItemBank(file = NA)
}
\arguments{
\item{file}{Pfad character der Länge 1, der den Pfadname zu einer .csv-Datei darstellt. Die Datei muss eine gültige ItemBank im Sinne des 4-PL-Modells sein.
Als Default-Wert für den Pfad fungiert ein Pfad zu einer Pakte-Datei, die in der Lib installiert wurde (was der eigentliche Clou dieser Funktion ist).}
}
\value{
data.frame für das 4PL-Modell
}
\description{
Liest die ItemBank ein
}
\details{
Es wird die ItemBank im 1:4PL-Modell eingelesen.
}
\examples{
ItemBank <- readItemBank()
head(ItemBank)
}
\author{
Harald Fiedler
}

