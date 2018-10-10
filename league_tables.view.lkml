view: league_tables {
  sql_table_name: dave_thesis.league_tables ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: draw {
    type: number
    sql: ${TABLE}.draw ;;
  }

  dimension: goal_difference {
    type: number
    sql: ${TABLE}.goal_difference ;;
  }

  dimension: goals {
    type: number
    sql: ${TABLE}.goals ;;
  }

  dimension: goals_against {
    type: number
    sql: ${TABLE}.goals_against ;;
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.lost ;;
  }

  dimension: played {
    type: number
    sql: ${TABLE}.played ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
    value_format: "0"
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: won {
    type: number
    sql: ${TABLE}.won ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}.points ;;
    drill_fields: [season,team,won,lost,draw,goals,position]
  }

  measure: max_league_points {
    type: number
    sql: max(${points}) ;;
  }

  measure: total_league_points {
    type: number
    sql: sum(${points}) ;;
  }

  measure: goals_scored {
    type: number
    sql: sum(${goals}) ;;
  }

  measure: total_goals_against {
    type: number
    sql: sum(${TABLE}.goals_against) ;;
  }

  measure: total_goal_difference {
    type: number
    sql: sum(${TABLE}.goal_difference) ;;
  }

  measure: league_season {
    type: number
    sql: ${season} ;;
  }

  measure: worst_league_position {
    type: number
    sql: max(${position}) ;;
  }

  measure: best_league_position {
    type: number
    sql: min(${position}) ;;
  }

  measure: league_wins {
    type: number
    sql: sum(${won}) ;;
  }

  measure: league_draws {
    type: number
    sql: sum(${draw}) ;;
  }

  measure: league_losses {
    type: number
    sql: sum(${lost}) ;;
  }

  measure: games_played {
    type: number
    sql: sum(${played}) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
