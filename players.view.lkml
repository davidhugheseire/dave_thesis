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

  dimension: position_group {
    label: "Position Group"
    type: string
    sql:
    CASE
          when ${position} = "GK" then "Goal Keeper"
          when ${position} = "RB" then "Defender"
          when ${position} = "LB" then "Defender"
          when ${position} = "CB" then "Defender"
          when ${position} = "LM" then "Midfield"
          when ${position} = "RM" then "Midfield"
          when ${position} = "DM" then "Midfield"
          when ${position} = "AM" then "Midfield"
          when ${position} = "CM" then "Midfield"
          when ${position} = "LW" then "Midfield"
          when ${position} = "RW" then "Midfield"
          when ${position} = "CF" then "Attacker"
          when ${position} = "SS" then "Attacker"
          else 'error'
          end;;
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
    sql: sum(${fpl_value}+10000.12345);;
    value_format: "0.00000"
  }

  measure: min_age {
    type: number
    sql:  min(${age}) ;;
    value_format:"#"
  }

  measure: max_age {
    type: number
    sql:  max(${age}) ;;
    value_format:"#"
  }

  measure: avg_age {
    type: number
    sql:  avg(${age}) ;;
    value_format:"#"
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

  measure: comebacks {
    label: "No of Comebacks"
    type: number
    sql:  sum(game_stats.home_wins) ;;
    value_format:"#"
  }


  measure: count {
type:count_distinct
sql: ${TABLE}.player_id;;
}

  measure: count_pos {
    type:count_distinct
    sql: ${TABLE}.position;;
  }





  measure: order_count {
    type: count_distinct
    drill_fields: [club, position_group, age_tier, total_fantasy_points]
    link: {label: "Pivot Age Tier" url: "{{link}}&pivots=players.age_tier"}
    sql: ${player_id} ;;
  }


  }


  ###############################################################################################################



#   view: players_registered {
#     sql_table_name: ${TABLE}.player ;;
#
#
#     dimension: id {
#       hidden: yes
#       primary_key: yes
#       type: string
#       sql: ${TABLE}.id ;;
#     }
#
#
#     dimension: sub_city {
#       type: string
#       sql: ${TABLE}.city ;;
#     }
#
#     dimension: sub_club {
#       type: string
#       sql: ${TABLE}.club  ;;
#     }
#
#
#     measure: count {
#       type: count
#     }
#
# }
#
#   view: subtotal_over {
#     sql_table_name: (select ‘’ as row_type union select null as row_type) ;; #This sql table name is used to create a duplicate copy of the data. When rowType is null, fields from this view will resolve to ‘SUBTOTAL’
#
# #used in sql parameters below to re-assign values to ‘SUBTOTAL’ on subtotal rows
#     dimension: row_type_checker {
#       hidden:yes
#       sql: ${TABLE}.row_type ;;
#     }
# #used for readability in sql_where of nested subtotal join
#     dimension: row_type_description {
#       hidden:yes
#       sql:coalesce(${TABLE}.row_type,‘SUBTOTAL’);;
#     }
#
#     dimension: city_name {
#       order_by_field: city_order
# # For subtotal rows: show ‘SUBTOTAL’. For nulls, show ‘∅’ (supports intuitive sorting). Otherwise use raw base table field’s data. Note, concatenation with ‘${row_type_checker}’ is used to concisely force subtotal rows to evaluate to null, which is then converted to ‘SUBTOTAL’
#       sql: coalesce(cast(coalesce(cast(${players_registered.sub_city} as varchar),‘∅’)||${row_type_checker} as varchar),‘SUBTOTAL’);;
#       html:{% if value == ‘SUBTOTAL’ %}SUBTOTAL{% else %} {{ linked_value }}{% endif %};;
#     }
#
#     dimension: city_order {
#       hidden: yes
# #For order by fields, use a similar calculation, but use values that correctly put nulls at min and subtotals at max of sort order positioning
#       sql: coalesce(cast(coalesce(cast(${players_registered.sub_city} as varchar),’ ')||${row_type_checker} as varchar),‘ZZZZZZZZZZ’);;
#     }
#   }
