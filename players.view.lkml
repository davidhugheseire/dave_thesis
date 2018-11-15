view: players {
  sql_table_name: dave_thesis.players ;;

  dimension: player_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: age {
    drill_fields: [player_name,age,club,nationality,position,total_market_value]
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

  measure: min_age {
    type: number
    sql:  min(${age}) ;;
  }

  measure: max_age {
    type: number
    sql:  max(${age}) ;;
  }

  measure: avg_age {
    type: number
    sql:  avg(${age}) ;;
  }

  dimension: player_name {
    description: "Name of the player"
    view_label: "Players"
    type: string
    sql:  ${TABLE}.player ;;
    html: {{linked_value}}
          <a href="https://www.google.com/search?q={{ value }}" height="90%" width="90%" target="_new">
          <img src="https://www.google.ie/url?sa=i&source=images&cd=&ved=2ahUKEwi654Sky8zeAhXECcAKHeRHDoUQjRx6BAgBEAU&url=http%3A%2F%2Fwww.pngpix.com%2Fdownload%2Ffootball-png-transparent-image-3&psig=AOvVaw1JZN2yKci6VNsN6JAREng6&ust=1542034225192168" height=15 width=15> </a> ;;
  }

  dimension: age_tier{
  type: tier
  tiers: [15,20,25,30,35,40]
  style: integer
  sql: ${age} ;;
  }



  measure: count {
type:count_distinct
sql: ${TABLE}.player_id;;
}

  measure: count_pos {
    type:count_distinct
    sql: ${TABLE}.position;;
  }

}
