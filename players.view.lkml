view: players {
  sql_table_name: dave_thesis.players ;;

  dimension: player_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: club {
    type: string
    sql: ${TABLE}.club ;;
  }

  dimension: fpl_points {
    type: number
    sql: ${TABLE}.fpl_points ;;
  }

  dimension: fpl_selected_by {
    type: number
    sql: ${TABLE}.fpl_selected_by ;;
  }

  dimension: fpl_value {
    type: number
    sql: ${TABLE}.fpl_value ;;
  }

  dimension: market_value {
    type: number
    sql: ${TABLE}.market_value ;;
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.nationality ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: player {
    type: string
    sql: ${TABLE}.player ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [player_id]
  }
  measure: total_market_value {
    type: number
    sql: sum(${market_value});;
    value_format: "#,##0"
  }
  measure: total_fantasy_points {
    type: number
    sql: sum(${fpl_points});;
    value_format: "#,##0"
  }
  measure: total_fantasy_value {
    type: number
    sql: sum(${fpl_value});;
    value_format: "#,##0"
  }

}
