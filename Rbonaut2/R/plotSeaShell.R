#' @author Harald Fiedler
#' @description Plottet die SeaShellGrafik
#' @details Es handelt sich um die extra für die Normgruppenvergleiche von Hoffenheim entwickelte Grafik
#' @param x numeric Der Item-Response-Wert des Probanden
#' @param A numeric Die Item-Response-Werte von Gruppe A
#' @param B numeric die Item-Response-Werte von Gruppe B
#' @param TitelA character mit der Headline für Gruppe A
#' @param TitelB character mit der Headline für Gruppe B
#' @param developperMode boolescher Wert, der eine Augenscheinkontrolle des Kernels und der Histogramms erlaubt.
#' @param gameover boolischer Wert, der bei TRUE base64 kodiertes Image wiedergibt
#' @return gameover=FALSE hat die Funktion keinen Ausgabe-wert, sonst base64 codiertes Image
#' @title plotSeaShell

plotSeaShell <- function(x, A, B, TitelA, TitelB, developperMode = FALSE, gameover=FALSE){
  if(gameover){
    pngfile <- tempfile()
    png(pngfile)
  }
  ### layout settings
  colorA = rgb(1, 1, 1, maxColorValue = 1.7)
  colorB = rgb(red=56, green=139, blue=255, maxColorValue = 255)
  colorBB = rgb(red=34, green=83, blue=153, maxColorValue = 255)
  colorX = rgb(red=247, green=78, blue=12, maxColorValue = 255)
  colorC = rgb(1, 1, 1, maxColorValue = 1.1) # hellgrau
  colorCC = rgb(1, 1, 1, maxColorValue = 3.7) # grey

  ### some Data
  ABx <- union(union(A, B), x)
  nA <- length(A)
  nB <- length(B)
  KD <- density(A, bw=.2)
  HG <- hist(B, plot = FALSE)

  ### low level plotting functions
  scaleX4Canvas <- function(x){
    x <- (x - min(ABx) ) / (max(ABx)-min(ABx)) # standardizing x to [0, 1]
    x <- (x+0.2)/1.4 # a bit more space
    return(x)
  }

  scaleKernelY4Canvas <- function(y){
    scaling <- 0.6*max(KD$y) # for layout purpose
    return(-1*scaling*y+0.5)
  }

  points.left <- function(x, y, ...){
    x <- scaleX4Canvas(x)
    y <- scaleKernelY4Canvas(y)
    points(y, x, ...)
  }

  lines.left <- function(x, y, ...){
    x <- scaleX4Canvas(x)
    y <- scaleKernelY4Canvas(y)
    lines(y, x, ...)
  }

  textOnCanvas <- function(x, y, ...){
    x <- scaleX4Canvas(x)
    y <- scaleKernelY4Canvas(y)
    text(y, x, ...)
  }

  lines.right <- function(x, y, ...){ # only for code simplicity
    lines.left(x, -y, ...)
  }


  ### Plot
  plot.new()

  ### Lines
  howManyLines <- 6
  for (myLine in 1:howManyLines){ # myLine = 2
    xValue <- min(KD$x) + myLine/6*(max(KD$x)-min(KD$x))
    lines.left(c(xValue, xValue), c(.8, -.8), col="grey")
    txt <- round(integrate.xy(x = KD$x, fx = KD$y, a = min(KD$x), b = KD$x[which.min( abs(KD$x - xValue))] ) * 100,0)
    textOnCanvas(xValue, .9, paste0(txt, "%"), col="grey")
    txt2 <- round(sum(B<xValue)/nB * 100, 0)
    textOnCanvas(xValue, -.9, paste0(txt2, "%"), col="grey")
  }
  # white space around Kernel Plot
  points.left(KD$x, KD$y, col="white", type="l", lwd=30)
  # white space around barplot
  for (bar in 1:length(HG$density)){# bar=2
    x1 = HG$breaks[bar]
    x2 = HG$breaks[bar+1]
    y1 = 0.00025
    y2 = HG$density[bar]
    # contour
    lines.right(c(x1, x1, x2, x2, x1), c(y1, y2, y2, y1, y1), col="white", lwd=20)
  }

  ### plot Kernel Density

  # Fill
  fillY <- as.numeric((t(matrix(c(rep(0.0025, times=length(KD$y)), KD$y), ncol=2))))
  fillX <- as.numeric((t(matrix(c(KD$x, KD$x), ncol=2))))
  lines.left(fillX[fillX<x], fillY[fillX<x], col=colorA, lwd=2)
  lines.left(fillX[fillX>x], fillY[fillX>x], col=rgb(1, 1, 1, maxColorValue = 1.1), lwd=2)
  # Shape
  points.left(KD$x[KD$x<x], KD$y[KD$x<x], col=colorCC, type="l", lwd=3)
  points.left(KD$x[KD$x>x], KD$y[KD$x>x], col=colorCC, type="l", lwd=2)

  q1 <- quantile(A)["25%"]
  q2 <- quantile(A)["50%"]
  q3 <- quantile(A)["75%"]
  q1y <- KD$y[which.min(abs(KD$x-q1))]
  q2y <- KD$y[which.min(abs(KD$x-q2))]
  q3y <- KD$y[which.min(abs(KD$x-q3))]
  lines.left(c(q1, q1), c(0, q1y), lwd=2, col=colorCC, lty=3)
  lines.left(c(q2, q2), c(0, q2y), lwd=3, col=colorCC, lty=3)
  lines.left(c(q3, q3), c(0, q3y), lwd=2, col=colorCC, lty=3)


  ### plot Histogramm
  for (bar in 1:length(HG$density)){# bar=3
    x1 = HG$breaks[bar]
    x2 = HG$breaks[bar+1]
    y1 = 0.00025
    y2 = HG$density[bar]
    # fill
    strokeDensity <- 160 # must be an even number
    if (x1 < x & x2 < x){
      lines.right(seq(from=x1, to=x2, length.out = strokeDensity), rep(c(y1, y2), times=strokeDensity/2), col=colorB, lwd=2)
    }
    if (x1 < x & x2 > x){
      lines.right(seq(from=x1, to=x, length.out = strokeDensity), rep(c(y1, y2), times=strokeDensity/2), col=colorB, lwd=2)
      lines.right(seq(from=x, to=x2, length.out = strokeDensity), rep(c(y1, y2), times=strokeDensity/2), col=rgb(1,1,1, maxColorValue = 1.1), lwd=2)
    }
    if (x1 > x & x2 > x){
      lines.right(seq(from=x1, to=x2, length.out = strokeDensity), rep(c(y1, y2), times=strokeDensity/2), col=rgb(1,1,1,maxColorValue = 1.1), lwd=2)
    }
  }

  # InnerSpacer
  for (bar in 1:length(HG$density)){
    if(HG$breaks[bar]<x){
      lines.right(c(HG$breaks[bar], HG$breaks[bar]), c(0, HG$density[bar]), col=colorBB, lwd=1)
    }else{
      lines.right(c(HG$breaks[bar], HG$breaks[bar]), c(0, HG$density[bar]), col=colorCC, lwd=1)
    }
  }

  # OuterContour
  for (bar in 1:length(HG$density)){

    if (HG$breaks[bar] < x & HG$breaks[bar + 1] < x){ # bar < x
      lines.right(c(HG$breaks[bar], HG$breaks[bar+1]), c(HG$density[bar], HG$density[bar]), col=colorBB, lwd=3 )
      if (bar==1){
        lines.right(c(HG$breaks[bar], HG$breaks[bar]), c(0, HG$density[bar]), col=colorBB, lwd=3 )
      }else{
        lines.right(c(HG$breaks[bar], HG$breaks[bar]), c(
          min(HG$density[bar], HG$density[bar-1]),
          max(HG$density[bar], HG$density[bar-1])
        ), col=colorBB, lwd=3 )
      }
    }

    if (HG$breaks[bar] < x & HG$breaks[bar + 1] > x){ #  x in bar
      lines.right(c(HG$breaks[bar], x), c(HG$density[bar], HG$density[bar]), col=colorBB, lwd=3 )
      lines.right(c(x, HG$breaks[bar+1]), c(HG$density[bar], HG$density[bar]), col=colorCC, lwd=2 )
      lines.right(c(HG$breaks[bar], HG$breaks[bar]), c(
        min(HG$density[bar], HG$density[bar-1]),
        max(HG$density[bar], HG$density[bar-1])
      ), col=colorBB, lwd=3 )
    }

    if (HG$breaks[bar] > x & HG$breaks[bar + 1] > x){ # bar > x
      lines.right(c(HG$breaks[bar], HG$breaks[bar+1]), c(HG$density[bar], HG$density[bar]), col=colorCC, lwd=2 )
      lines.right(c(HG$breaks[bar], HG$breaks[bar]), c(
        min(HG$density[bar], HG$density[bar-1]),
        max(HG$density[bar], HG$density[bar-1])
      ), col=colorCC, lwd=2 )
    }

    if (bar==length(HG$density)){
      lines.right(c(HG$breaks[bar+1], HG$breaks[bar+1]), c(0, HG$density[bar]), col=colorCC, lwd=2 )
    }

  }

  # Medianlinie in Histogramm
  barNumberOfMedian <- which.min(abs(HG$mids-median(B, na.rm=TRUE)))
  medianDensity <- HG$density[barNumberOfMedian]
  lines.right(c(median(B, na.rm = TRUE), median(B, na.rm=TRUE)), c(0, medianDensity-0.005), col=colorCC, lwd=3, lty=3)

  ### Plot spine
  lines.left(c(min(HG$breaks, KD$x),max(HG$breaks, KD$x)), c(0, 0), col=colorCC, lwd=1)
  if (developperMode){
    points(rep(0.5, times=nA) , scaleX4Canvas(A), col=colorA, cex=0.5, pch=16)
    points(rep(0.5, times=nB) , scaleX4Canvas(B), col=colorBB, cex=0.5, pch=16)
  }
  ### plot X
  lines.left(c(x, x), c( KD$y[which.min(abs(KD$x-x))]   , -HG$density[which.min(abs(x-HG$mids))]), col=colorX, lwd=3)

  ### setting the Text
  setPercent <- function(x, y, P_numeric, ...){ # P_numeric = 31.811
    ante <- as.integer(floor(P_numeric))
    post <- as.integer(  round( (P_numeric - floor(P_numeric))*10, 1))
    txt1 <- paste0(ante, ",")
    txt2 <- paste0(post, "%")
    textOnCanvas(x, y, txt1, pos=2, cex=2, offset=0, ...)
    textOnCanvas(x, y, txt2, pos=4, cex=1, offset=0, ...)
  }

  ### magenta Score
  xLevelA <- round(integrate.xy(x = KD$x, fx = KD$y, a = min(KD$x), b = KD$x[which.min( abs(KD$x - x))] ) * 100,1)
  points.left(x+.01, .95, col="white", cex=11, pch=21, bg="#dcdcdc")
  setPercent(x=x, .92, xLevelA, col=colorX)

  ### grey Score
  xLevelB <- round((sum(x>B)/nB*100),1)
  points.left(x, -.95, col="white", cex=11, pch=21, bg="#dcdcdc")
  setPercent(x=x, -.98, xLevelB, col=colorB)

  ### Titles
  text(.5, 1.01, TitelA, col=colorA, cex=2, pos = 2, offset = 1)
  text(.5, 1.01, TitelB, col=colorB, cex=2, pos=4, offset = 1)
  if(gameover){
    dev.off()
    return(base64enc::base64encode(pngfile))
    unlink(pngfile)
  }
}

#
# set.seed(142)
# A <- c(rnorm(100), rnorm(30, mean=0.2))
# B <- rnorm(22, mean=1.2)
# x <- 0.678
# TxtA <- "17 jährige"
# TxtB <- "TSG U23"
#

# A <- c(0.9375749, 1.3901799, 0.5112297, 1.0491721, 0.4709042)
# B <- NormTree$U14$RAW$Fiedler2016a
# x <- 0.47
# TxtA <- 'Mustermann, Tim'
# TxtB <- 'U14'
# png('~/Bilder/changeform.png')
# plotSeaShell(x=x, A=A, B=B, TitelA = TxtA, TitelB=TxtB)
# dev.off()

#png('~/Bilder/changeform2.png')
#plotSeaShell(x=x, A=A, B=B, TitelA = TxtA, TitelB=TxtB)
#dev.off()
