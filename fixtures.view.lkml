view: fixtures {
  sql_table_name: dave_thesis.fixtures ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: away_team {
    type: string
    sql: ${TABLE}.away_team ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: home_team {
    type: string
    sql: ${TABLE}.home_team ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
