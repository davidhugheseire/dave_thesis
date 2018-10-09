connection: "lookerdata_publicdata"

# include all the views
include: "*.view"

datagroup: dave_football_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: home_team_datagroup  {
  sql_trigger: SELECT MAX(id) FROM game_stats;;
  max_cache_age: "8 hours"
}

persist_with: dave_football_thesis_default_datagroup


explore: club {}
explore: game_stats {}
explore: league_tables {}
explore: players {}
explore: top_scorer {}
explore: odds {}


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
}
