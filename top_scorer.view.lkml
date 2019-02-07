view: top_scorer {
  sql_table_name: dave_thesis.top_scorer ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: club {
    type: string
    sql: ${TABLE}.club ;;
  }

  dimension: goals {
    type: number
    sql: ${TABLE}.goals ;;
  }

  dimension: player {
    type: string
    sql: ${TABLE}.player ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: season {
    type: string
    sql: ${TABLE}.season ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_goals {
    label: "Total Players Goals"
    type: number
    sql: sum(${goals}) ;;
  }
}
