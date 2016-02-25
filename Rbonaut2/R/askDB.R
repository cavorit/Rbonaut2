#' @author Harald Fiedler
#' @description Fragt die DB ab
#' @details Diese Funktion fragt auf localhost einen DB-dump der fbn-Datenbank ab und ersetzt das Copy&Paste-Verfahren der shinyApp
#' @param Anfangsdatum character der Länge 1 im Format "JJJJ-MM-DD", welches dann zu einem Datumsobjekt umgewandelt wird. Achtung: Zeitzone könnte ein paar Probleme aufwerfen.
#' @param Enddatum character der Länge 1 im Format "JJJJ-MM-DD"
#' @return data.frame das dann von augmentRAW() weiterverarbeitet werden kann.
#' @title askDB
#'
#'


askDB <- function(Anfangsdatum, Enddatum){
  library(RPostgreSQL)
  drv = dbDriver("PostgreSQL")
  dbname = "fbn"
  user = "hf"
  password = "123456"
  host = "localhost"
  port = 5432
  con <- dbConnect(drv = drv, dbname=dbname, user=user, password=password, port=port)

  Query <- paste0("
  SELECT

  webapp_playedshot.id AS keyb,
  webapp_playedshot.session_id AS keys,
  webapp_player.id AS keyp,
  webapp_sessiontemplate.id AS keyt,

  webapp_playedsession.start_date AS sessiontimestamp,
  webapp_playedshot.start_timestamp AS balltimestamp,

  webapp_team.name AS team,
  webapp_footbonaut.name AS fbn,

  TRANSLATE(webapp_player.name,';',',') AS spielername,
  webapp_player.birthday AS geburtstag,
  age(webapp_playedsession.start_date, webapp_player.birthday) AS alter,
  webapp_player.position AS pos,

  webapp_playedsession.name AS sessionname,
  webapp_playedshot.idx AS idx,

  webapp_playedshot.played_angle AS CGoalWinkel,
  webapp_playedshot.ballmachine AS adrm,
  webapp_playedshot.own_targets AS adrw,
  webapp_playedshot.opponent_targets AS adrd,
  webapp_playedshot.shot_delay AS delay,
  webapp_playedshot.speed_left AS sl,
  webapp_playedshot.speed_right AS sr,
  webapp_playedshot.vertical_angle AS va,
  webapp_playedshot.goal_hit AS goal,
  webapp_playedshot.goal_actual AS hit,
  webapp_playedshot.goal_actual_height AS flachstufe,
  webapp_playedshot.duration AS time,
  webapp_playedshot.points AS score

  FROM
  webapp_playedshot
  INNER JOIN (
  webapp_playedsession
  INNER JOIN
  webapp_sessiontemplate
  ON webapp_playedsession.session_template_id = webapp_sessiontemplate.id
  )
  ON webapp_playedshot.session_id = webapp_playedsession.id
  INNER JOIN(
  webapp_player
  INNER JOIN
  webapp_footbonaut
  ON webapp_player.footbonaut_id = webapp_footbonaut.id
  INNER JOIN
  webapp_team
  ON webapp_player.team_id = webapp_team.id
  )
  ON webapp_playedshot.player_id = webapp_player.id

  WHERE
  DATE(start_date) BETWEEN '", Anfangsdatum, "' AND '", Enddatum, "' ORDER BY balltimestamp ASC;")

  DF <- dbGetQuery(conn=con, statement = Query)

  dbDisconnect(con)

  return(DF)
}







