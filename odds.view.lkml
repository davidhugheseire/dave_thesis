view: odds {
  sql_table_name: dave_thesis.odds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: bookie {
    type: string
    sql: ${TABLE}.bookie ;;
  }
  dimension: _draw_odds {
    type: number
    sql: ${TABLE}.draw_odds ;;
  }
  dimension: _home_win_odds {
    type: number
    sql: ${TABLE}.home_win_odds ;;
  }

  dimension: _away_win_odds {
    type: number
    sql: ${TABLE}.away_win_odds ;;
  }

  #measure: home_win_odds {
  #  type: number
  #  sql: max(${_home_win_odds}) ;;
  #  drill_fields: [bookie,_home_win_odds]
  #  value_format: "0.00"
  #}

  #measure: away_win_odds {
  #  type: number
  #  sql: max(${_away_win_odds}) ;;
  #  drill_fields: [bookie,_away_win_odds]
  #  value_format: "0.00"
  #}

  #measure: draw_odds {
  #  type: number
  #  sql: max(${_draw_odds}) ;;
  #  drill_fields: [bookie,_draw_odds]
  #  value_format: "0.00"
  #}

  measure: avg_draw_odds {
    label: "Avg Draw Odds"
    type: number
    sql: avg(${_draw_odds}) ;;
    drill_fields:  [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: avg_home_win_odds {
    label: "Avg Home Win Odds"
    type: number
    sql: avg(${_home_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: avg_away_win_odds {
    label: "Avg Away Win Odds"
    type: number
    sql: avg(${_away_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.away_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: max_draw_odds {
    label: "Best Draw Odds"
    type: number
    sql: max(${_draw_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.draw_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: max_home_win_odds {
    label: "Best Home Win Odds"
    type: number
    sql: max(${_home_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: max_away_win_odds {
    label: "Best Away Win Odds"
    type: number
    sql: max(${_away_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,game_stats.result_full_time,odds.bookie,odds._away_win_odds]
    value_format: "0.00"
  }

  measure: min_draw_odds {
    label: "Worst Away Win Odds"
    type: number
    sql: min(${_draw_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.draw_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: min_home_win_odds {
    label: "Worst Home Win Odds"
    type: number
    sql: min(${_home_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }

  measure: min_away_win_odds {
    label: "Worst Away Win Odds"
    type: number
    sql: min(${_away_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.away_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }
  measure: home_win_implied_probability {
    label: "home win implied probability"
    type: number
    sql: (1/ ${avg_home_win_odds}) * 100 ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format:"0\%"
  }
  measure: away_implied_probability {
    label: "away win implied probability"
    type: number
    sql: (1/ ${avg_away_win_odds}) * 100 ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format:"0\%"
  }
  measure: draw_implied_probability {
    label: "draw implied probability"
    type: number
    sql: (1/ ${avg_draw_odds}) * 100 ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format:"0\%"
  }

  dimension: match_id {
    type: string
    sql: ${TABLE}.match_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
