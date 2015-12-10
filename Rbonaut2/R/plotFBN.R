#' @author Harald Fiedler
#' @title plotFBN
#' @details  Zeichnet schematisch den Footbonaut
#' @param Adresses boolescher Wert der angibt, ob die Fensteradressen mit eingegeben werden sollen.
#' @examples
#' plotFBN(Adresses=FALSE)
#'


plotFBN <- function(Adresses=TRUE){
    plot.new()
    rect(xleft = 0, ybottom = 0, xright = 1, ytop = 1)
    rect(xleft = 0.2, ybottom = 0.2, xright = 0.8, ytop = 0.8, col = "darkgreen")
    draw.circle(x = 0.5, y = 0.5, radius = 0.2, border = "white", lwd = 3)

    #unten
    x <- seq(from = 2, to = 10, by = 1)/13
    rect(xleft = x, ybottom = 0, xright = (x + 1/13), ytop = 2/13)
    lines(x = c(2, 11)/13, y = c(1, 1)/13)
    if(Adresses){text(x = x+(1/26), y = c(3/26), seq(from=2, to=18, by=2))}
    if(Adresses){text(x = x+(1/26), y = c(1/26), seq(from=1, to=17, by=2))}

    #oben
    x <- seq(from = 2, to = 10, by = 1)/13
    rect(xleft = x, ybottom = 11/13, xright = (x + 1/13), ytop = 13/13)
    lines(x = c(2, 11)/13, y = c(12, 12)/13)
    if(Adresses){text(x = x+(1/26), y = c(23/26), seq(from=54, to=38, by=-2))}
      if(Adresses){text(x = x+(1/26), y = c(25/26), seq(from=53, to=37, by=-2))}

    #rechts
    y <- seq(from = 2, to = 10, by = 1)/13
    rect(xleft = 11/13, ybottom = y, xright = 13/13, ytop = (y + 1/13))
    lines(y = c(2, 11)/13, x = c(12, 12)/13)
    if(Adresses){text(y = y+(1/26), x = c(23/26), seq(from=20, to=36, by=2))}
      if(Adresses){text(y = y+(1/26), x = c(25/26), seq(from=19, to=35, by=2))}

    #links
    y <- seq(from = 2, to = 10, by = 1)/13
    rect(xleft = 0/13, ybottom = y, xright = 2/13, ytop = (y + 1/13))
    lines(y = c(2, 11)/13, x = c(1, 1)/13)
    if(Adresses){text(y = y+(1/26), x = c(3/26), seq(from=72, to=56, by=-2))}
    if(Adresses){text(y = y+(1/26), x = c(1/26), seq(from=71, to=55, by=-2))}

}
