view: games {
  sql_table_name: dave_thesis.games ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: away_team_id {
    type: string
    sql: ${TABLE}.away_team_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      day_of_month,
      day_of_week,
      week_of_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }
  measure: measure_division {
    type: string
    sql: count(${TABLE}.division) ;;
  }

  dimension: home_team_id {
    type: string
    sql: ${TABLE}.home_team_id ;;
  }

  dimension: league {
    type: string
    sql: ${TABLE}.league ;;
  }

  dimension: match_index {
    type: number
    sql: ${TABLE}.match_index ;;
  }

  dimension: referee {
    type: string
    sql: ${TABLE}.referee ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
