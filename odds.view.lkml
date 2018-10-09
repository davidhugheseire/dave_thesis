view: odds {
  sql_table_name: dave_thesis.odds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _away_win_odds {
    type: number
    sql: ${TABLE}.away_win_odds ;;
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

  measure: home_win_odds {
    type: number
    sql: max(${_home_win_odds}) ;;
    drill_fields: [bookie,_home_win_odds]
    value_format: "0.00"
  }
  measure: away_win_odds {
    type: number
    sql: max(${_away_win_odds}) ;;
    drill_fields: [bookie,_away_win_odds]
    value_format: "0.00"
  }
  measure: draw_odds {
    type: number
    sql: max(${_draw_odds}) ;;
    drill_fields: [bookie,_draw_odds]
    value_format: "0.00"
  }
  measure: avg_draw_odds {
    type: number
    sql: avg(${_draw_odds}) ;;
    drill_fields: [bookie,_draw_odds]
    value_format: "0.00"
  }
  measure: avg_home_win_odds {
    type: number
    sql: avg(${_home_win_odds}) ;;
    drill_fields: [games.date_raw,game_stats.home_team,game_stats.away_team,game_stats.home_team_goals,game_stats.away_team_goals,odds.home_win_odds,game_stats.result_full_time,odds.bookie]
    value_format: "0.00"
  }
  measure: avg_away_win_odds {
    type: number
    sql: avg(${_away_win_odds}) ;;
    drill_fields: [bookie,_draw_odds]
    value_format: "0.00"
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
