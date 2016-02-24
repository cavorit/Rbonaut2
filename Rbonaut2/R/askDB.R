#' @author Harald Fiedler
#' @description Fragt die DB ab
#' @details Diese Funktion fragt auf localhost einen DB-dump der fbn-Datenbank ab und ersetzt das Copy&Paste-Verfahren der shinyApp
#' @param Anfangsdatum character der Länge 1 im Format "JJJJ-MM-DD", welches dann zu einem Datumsobjekt umgewandelt wird. Achtung: Zeitzone könnte ein paar Probleme aufwerfen.
#' @param Enddatum character der Länge 1 im Format "JJJJ-MM-DD"
#' @return data.frame das dann von SQL2DF() weiterverarbeitet werden kann.
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

TXT1 <- "SELECT
translate(webapp_player.name,';',',') AS spielername,
webapp_player.birthday AS geboren,
webapp_player.position AS pos,
webapp_playedsession.start_date AS date,
webapp_playedsession.session_template_ID AS template,
webapp_playedshot.idx AS idx,
webapp_playedshot.ballmachine AS adrm,
webapp_playedshot.own_targets AS adrw,
webapp_playedshot.opponent_targets AS adrd,
webapp_playedshot.shot_delay AS delay,
webapp_playedshot.speed_left AS sl,
webapp_playedshot.speed_right AS sr,
webapp_playedshot.vertical_angle AS va,
webapp_playedshot.played_angle AS deg,
webapp_playedshot.goal_hit AS goal,
webapp_playedshot.goal_actual AS hit,
webapp_playedshot.goal_actual_height AS flachstufe,
webapp_playedshot.duration AS time,
webapp_playedshot.points AS score,
webapp_team.name AS team,
webapp_footbonaut.name AS fbn"

TXT2 <- "FROM
webapp_playedshot
inner join (
webapp_playedsession
inner join
webapp_sessiontemplate
on webapp_playedsession.session_template_id = webapp_sessiontemplate.id
)
on webapp_playedshot.session_id = webapp_playedsession.id
inner join(
webapp_player
inner join
webapp_footbonaut
on webapp_player.footbonaut_id = webapp_footbonaut.id
inner join
webapp_team
on webapp_player.team_id = webapp_team.id
)
on webapp_playedshot.player_id = webapp_player.id
"

TXT3 <- "
WHERE
DATE(start_date) BETWEEN '2014-02-07' AND '2014-02-15'
ORDER BY date asc;
"

}




# dbListTables(con)
# dbListFields(con,"webapp_team")
# dbReadTable(con,"webapp_team")
# dbGetQuery(con, statement = "select * from webapp_team")
# dbGetQuery(con, statement = paste0(TXT1, TXT2, TXT3))
#
# dbDisconnect(con)
#
