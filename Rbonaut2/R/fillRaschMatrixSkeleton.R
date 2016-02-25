#' @author Harald Fiedler
#' @title fillRaschMatrixSkeleton
#' @description Füllt die NA-Matrix mit 0 und 1, wo es zutreffend ist.
#' @param DF data.frame auf Ballebene, etwa per SQL2DF erworben
#' @param RaschMatrixSkeleton matrix , belabeled mit SessionIDs und ItemIDs, wird etwa aus erstelleRaschMatrixSkeleton() erworben.
#' @return Eine RaschMatrix mit vielen NA, und wenigen 0 und einigen 1en.


fillRaschMatrixSkeleton <- function(DF, RaschMatrixSkeleton){
  ItemIDNamen <- colnames(RaschMatrixSkeleton)
  SessionIndex <- unique(DF$keyS)
  for (S in SessionIndex){# S <- SessionIndex[1]
    EineSession <- DF[DF$keyS==S,]
    for (B in EineSession$idX){ # B <- EineSession$idX[1]
      EinBall <- EineSession[EineSession$idX==B,]
      if (  is.element(EinBall$ItemID, colnames(RaschMatrixSkeleton))  ){RaschMatrixSkeleton[rownames(RaschMatrixSkeleton)==S, EinBall$ItemID] <- EinBall$ItemResponse}
    }
  }
  return(RaschMatrixSkeleton)
}
