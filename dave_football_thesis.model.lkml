connection: "lookerdata_publicdata"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


datagroup: dave_football_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}


datagroup: bqml_datagroup {
  #retrain model every day
  max_cache_age: "1 hour"
  sql_trigger: SELECT CURRENT_DATE() ;;
}

datagroup: league_pdt_datagroup  {
  sql_trigger: SELECT MAX(id) FROM game_stats;;
  max_cache_age: "30 minutes"
}

persist_with: dave_football_thesis_default_datagroup


explore: club {}
explore: game_stats {}
explore: league_tables {}
#explore: players {}
explore: top_scorer {}
explore: odds {}
explore: league_pdt {}
#explore: home_stats_pdt {}
explore: away_stats_pdt {}
explore: fixture_history_pdt {}
explore: features {}
explore: fixtures {}
#explore: future_win_prediction {}


explore: players {
  join: game_stats {
    type: left_outer
    sql_on: ${players.team_id} = ${game_stats.id} ;;
    relationship: many_to_one
  }
}

explore: home_stats_pdt {
  join: away_stats_pdt{
    type: left_outer
    sql_on: ${home_stats_pdt.home_team_id} = ${away_stats_pdt.away_team_id};;
    relationship: one_to_one
  }
}

explore: games {
join: game_stats {
  type: left_outer
  sql_on: ${games.id} = ${game_stats.id} ;;
  relationship: one_to_one
  }
  join: club {
    type: left_outer
    sql_on: ${club.team_id} = ${games.home_team_id} ;;
    relationship: one_to_one
  }
  join: odds {
    type: left_outer
    sql_on: ${odds.match_id} = ${games.id} ;;
    relationship: one_to_one
  }
  join: league_tables{
  type: left_outer
  sql_on: ${games.home_team_id} = ${league_tables.team_id} ;;
  relationship: one_to_one
  }
  join: players{
    type: left_outer
    sql_on: ${players.team_id} = ${games.home_team_id};;
    relationship: one_to_one
  }
  join: top_scorer{
    type: left_outer
    sql_on: ${top_scorer.club} = ${players.club};;
    relationship: one_to_many
  }
  join: league_pdt{
    type: left_outer
    sql_on: ${top_scorer.club} = ${players.club};;
    relationship: one_to_many
  }
  join: home_stats_pdt{
    type: left_outer
    sql_on: ${home_stats_pdt.home_team_id} = ${games.home_team_id};;
    relationship: one_to_one
  }
  join: away_stats_pdt{
    type: left_outer
    sql_on: ${away_stats_pdt.away_team_id} = ${games.away_team_id};;
    relationship: one_to_one
  }
  join: features{
    type: left_outer
    sql_on: ${features.id} =  ${game_stats.id} ;;
    relationship: one_to_one
  }
  join: fixtures{
    type: left_outer
    sql_on: ${fixtures.home_team} =  ${game_stats.home_team} and ${fixtures.away_team} =  ${game_stats.away_team};;
    relationship: many_to_many
  }
  join: fixture_history_pdt{
    type: left_outer
    sql_on: ${fixture_history_pdt.home_team_id} = ${games.home_team_id}
    and ${fixture_history_pdt.away_team_id} = ${games.away_team_id};;
    relationship: one_to_one
  }
  join: future_win_prediction{
    type: left_outer
    sql_on: ${future_win_prediction.id} = ${games.id};;
    relationship: one_to_one
  }

}
