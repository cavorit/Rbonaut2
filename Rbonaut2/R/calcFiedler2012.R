#' @author Harald Fiedler
#' @title calcFiedler2012
#' @param SQL data.frame wie er per askDB() erzeugt wird.
#' @return data.frame mit zusätzliche Spalte Fiedler2012
#' @details Es handelt sich dabei um die ursprüngliche Formel, die Harald Fiedler ehrenamtlich für CGoal am 12.2.2012 erstellt hat. Da CGoal inzwischen diese Formel mehrfach manipuliert hat, ist es wichtig, die Originalformel von CGoalScore zu unterscheiden.
#' @description Berechnet einen Score nach der Heuristik von Fiedler (2012)



calcFiedler2012 <- function(SQL){

    Term01 <- 1218.250 * exp(-(SQL$time/1000))
    Term02 <- 100 * exp(1/50 * SQL$goal - 2)
    maximalerWalzenSpeed <- (apply(data.frame(SQL$sl, SQL$sr), 1, max))
    Term03 <- (2^( maximalerWalzenSpeed / 100 ) ) + 3^((1000-SQL$delay)/(1000)) + 2^(SQL$va/20)
    Term04 <- exp((log(4)/360)*(playedAngle(adrA = SQL$adrm, adrB = getFirstAdrW(adrW=SQL$adrw)))/40)
    FBN <- Term01 * Term02 * Term03 * Term04
    Fiedler2012 <- 1.006693 * (exp(5))/(1+exp(5)) * FBN
    SQL$Fiedler2012 <- Fiedler2012
    return(SQL)
}


