view: game_stats {
  sql_table_name: dave_thesis.game_stats ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: away_team {
    type: string
    sql: ${TABLE}.away_team ;;
    drill_fields: [games.league,away_team]
    group_label: "Away Info"
  }

  dimension: away_team_corners {
    type: number
    sql: ${TABLE}.away_team_corners ;;
    group_label: "Away Info"
  }

  dimension: away_team_fouls {
    type: number
    sql: ${TABLE}.away_team_fouls ;;
    group_label: "Away Info"
  }

  dimension: away_team_goals {
    type: number
    sql: ${TABLE}.away_team_goals ;;
    group_label: "Away Info"
  }

  measure: quarter_wage1 {
    type: sum
    sql: ${TABLE}.away_team_goals;;
    group_label: "Quarter"
  }

  measure: quarter_wage2 {
    type: sum
    sql: ${TABLE}.away_team_goals;;
    group_label: "Quarter"
  }

  dimension: away_team_half_time_goals {
    type: number
    sql: ${TABLE}.away_team_half_time_goals;;
  }

  dimension: away_team_red_cards {
    type: number
    sql: ${TABLE}.away_team_red_cards ;;
  }

  dimension: away_team_shots {
    type: number
    sql: ${TABLE}.away_team_shots ;;
  }

  dimension: away_team_shots_on_target {
    type: number
    sql: ${TABLE}.away_team_shots_on_target ;;
  }

  dimension: away_team_yellow_cards {
    type: number
    sql: ${TABLE}.away_team_yellow_cards ;;
  }

  dimension: full_time_score {
    type: string
    sql: ${TABLE}.full_time_score ;;
  }

  dimension: half_time_score {
    type: string
    sql: ${TABLE}.half_time_score ;;
  }

  dimension: home_team {
    type: string
    sql: ${TABLE}.home_team ;;
    drill_fields: [games.date_raw,home_team,away_team,home_team_goals,away_team_goals,odds.home_win_odds,odds.away_win_odds,odds.draw_odds]
  }

  dimension: home_team_shots_on_target {
    type: number
    sql: ${TABLE}.home_team__shots_on__target ;;
  }

  dimension: home_team_corners {
    type: number
    sql: ${TABLE}.home_team_corners ;;
  }

  dimension: home_team_fouls {
    type: number
    sql: ${TABLE}.home_team_fouls ;;
  }

  dimension: home_team_goals {
    type: number
    sql: ${TABLE}.home_team_goals ;;
  }

  dimension: home_team_half_time_goals {
    type: number
    sql: ${TABLE}.home_team_half_time_goals ;;
  }

  dimension: home_team_red_cards {
    type: number
    sql: ${TABLE}.home_team_red_cards ;;
  }

  dimension: home_team_shots {
    type: number
    sql: ${TABLE}.home_team_shots ;;
  }

  dimension: home_team_yellow_cards {
    type: number
    sql: ${TABLE}.home_team_yellow_cards ;;
  }

  dimension: half_time_result {
    case: {
      when: {
        sql: half_time_score = 'H' ;;
        label: "Home team winning"
      }
      when: {
        sql: half_time_score = 'D' ;;
        label: "Draw"
      }
      when: {
        sql: half_time_score = 'A' ;;
        label: "Away team Winning"
      }
    }
  }

  dimension: full_time_result {
    case: {
      when: {
        sql: full_time_score = 'H' ;;
        label: "Home team won"
      }
      when: {
        sql: full_time_score = 'D' ;;
        label: "Draw"
      }
      when: {
        sql: full_time_score = 'A' ;;
        label: "Away team Won"
      }
    }
  }


  dimension: result_full_time {
    sql: ${full_time_result} ;;
    html:
    {% if value == "Home team won" %}
      <div><img src="https://www.hiesscheme.org.uk/installers/wp-content/uploads/2018/07/check-mark-green-tick-mark.png" width=40px height=40px align="middle"/></div>
    {% elsif value == "Away team Won" %}
      <div><img src="https://image.flaticon.com/icons/png/512/458/458594.png" width=40px height=40px align="middle"/></div>
    {% else %}
      <div><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Breezeicons-actions-22-filename-dash-amarok.svg/2000px-Breezeicons-actions-22-filename-dash-amarok.svg.png" width=40px height=40px align="middle"/></div>
    {% endif %}

;;
  }





  dimension: away_result {
    sql: ${full_time_result} ;;
    html:
    {% if value == "Home team won" %}
    <div><img src="https://image.flaticon.com/icons/png/512/458/458594.png" width=40px height=40px align="middle"/></div>
    {% elsif value == "Away team Won" %}
    <div><img src="https://www.hiesscheme.org.uk/installers/wp-content/uploads/2018/07/check-mark-green-tick-mark.png" width=40px height=40px align="middle"/></div>
    {% else %}
    <div><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Breezeicons-actions-22-filename-dash-amarok.svg/2000px-Breezeicons-actions-22-filename-dash-amarok.svg.png" width=40px height=40px align="middle"/></div>
    {% endif %}
;;
  }
  dimension: result_last_10 {
    sql: ${full_time_result} ;;
    html:
    {% if value == "Home team won" %}
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ "W" }}</p>
    {% elsif value == "Away team Won" %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ "L" }}</p>
    {% else %}
      <p style="color: black; background-color: lightyellow; font-size:100%; text-align:center">{{ "D" }}</p>
    {% endif %}
;;
  }

  dimension: team_image  {
    description: "Home Team Crest"
    type: string
    sql:  ${TABLE}.home_team ;;
    html:
    {% if {{value}} == "Arsenal" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t3.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Brighton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t36.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Burnley" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Chelsea" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t8.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Crystal Palace" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t31.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Everton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t11.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Huddersfield" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t38.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Leicester" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t13.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Liverpool" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t14.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Man City" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t43.svg  " width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Manchester United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t1.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Newcastle United" or {{value}} == "Newcastle" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t4.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Southampton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t20.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Stoke" %}
    <div><img src="https://cdn.shopify.com/s/files/1/1888/7339/files/Stoke_City_06_grande.jpg?v=1498033163" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Swansea City" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Tottenham" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t6.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Watford" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t57.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Bromwich Albion" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t35.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Ham United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t21.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Wolverhampton Wanderers" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t39.svg" width="55%" height="55%" align="middle"/></div>
    {% endif %} ;;
  }

  dimension: ateam_image  {
    description: "Away Team Crest"
    type: string
    sql:  ${TABLE}.away_team ;;
    html:
    {% if {{value}} == "Arsenal" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t3.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Brighton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t36.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Burnley" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Chelsea" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t8.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Crystal Palace" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t31.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Everton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t11.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Huddersfield" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t38.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Leicester" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t13.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Liverpool" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t14.svg" width="30%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Man City" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t43.svg  " width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Manchester United" or {{value}} == "Man United"%}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t1.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Newcastle United" or {{value}} == "Newcastle"%}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t4.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Southampton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t20.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Stoke" %}
    <div><img src="https://cdn.shopify.com/s/files/1/1888/7339/files/Stoke_City_06_grande.jpg?v=1498033163" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Swansea City" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Tottenham" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t6.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Watford" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t57.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Bromwich Albion" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t35.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Ham United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t21.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Wolverhampton Wanderers" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t39.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Aston Villa" %}
    <div><img src="https://upload.wikimedia.org/wikipedia/en/thumb/f/f9/Aston_Villa_FC_crest_%282016%29.svg/1200px-Aston_Villa_FC_crest_%282016%29.svg.png" width="20%" height="30%" align="middle"/></div>
    {% elsif {{value}} == "Newcastle" %}
    <div><img src="https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Newcastle_United_Logo.svg/1200px-Newcastle_United_Logo.svg.png" width="20%" height="30%" align="middle"/></div>
    {% endif %} ;;
  }



  dimension: both_teams_score {
    type: yesno
    sql: ${home_team_goals} > 0 and ${away_team_goals} > 0  ;;
  }


 ################################# dimension end

  measure: count {
    type: count_distinct
    drill_fields: [id]
  }

  measure: count_games {
    type: count_distinct
    sql:${game_stats.id};;
    drill_fields: [games.date_raw,home_team,away_team,home_team_goals,away_team_goals,odds.home_win_odds,odds.away_win_odds,odds.draw_odds]
  }

  measure: count_teams {
    type: count_distinct
    sql:${game_stats.home_team};;
    drill_fields: [club.team_name,club.city,club.stadium,club.capacity,club.location]
  }

  measure: count_goals {
    type: number
    sql: sum(${home_team_goals}+${away_team_goals});;
  }

  measure: count_away_goals {
    type: number
    sql: sum(${away_team_goals});;
  }

  measure: count_home_goals {
    type: number
    sql: sum(${home_team_goals});;
  }

  measure: count_home_team_half_time_goals {
    type: number
    sql: sum(${home_team_half_time_goals});;
  }

  measure: count_away_team_half_time_goals {
    type: number
    sql: sum(${away_team_half_time_goals});;
  }

  measure: home_wins{
    type: count_distinct
    drill_fields: [games.date_raw,home_team,away_team,home_team_goals,away_team_goals,odds.home_win_odds]
    sql: ${game_stats.id} ;;

    filters: {
      field: full_time_score
      value: "H"
    }
  }




  measure: away_wins{
    type: count_distinct
    sql: ${game_stats.id} ;;
    drill_fields: [games.date_raw,away_team,away_team_goals,home_team,home_team_goals,odds.away_win_odds]
    filters: {
      field: full_time_score
      value: "A"
    }
    group_label: "Away Info"
  }

  measure: draws{
    type: count_distinct
    sql: ${game_stats.id} ;;
    drill_fields: [games.date_raw,home_team,away_team,home_team_goals,away_team_goals,odds.draw_odds]
    filters: {
      field: full_time_score
      value: "D"
    }
  }

  measure: both_teams_scored{
    type: count_distinct
    sql: ${game_stats.id} ;;
    drill_fields: [games.date_raw,home_team,away_team,home_team_goals,away_team_goals,odds.draw_odds]
    filters: {
      field: both_teams_score
      value: "yes"
    }
  }

  measure: both_team_score_percent {
    type: number
    sql: (${both_teams_scored}/${count_games})*100;;
    value_format:"0\%"
  }

  measure: both_team_score_percent_guage {
    type: number
    sql: (${both_teams_scored}/${count_games})*100;;
    value_format:"0\%"
    html: {{value}}<img src="https://chart.googleapis.com/chart?chs=500x300&cht=gom&chxt=y&chco=d84341,efb30e,f2f210,6fe043&chf=bg,s,FFFFFF00&chd=t:{{ value }}"/> ;;
  }

  measure: home_come_back {
    type: number
    sql: ${count_away_team_half_time_goals}-${count_home_team_half_time_goals};;
  }
  measure: home_come_back2 {
    type: number
    sql: ${count_away_team_half_time_goals};;
  }

  measure: away_come_back {
    type: number
    sql: ${count_home_team_half_time_goals}-${count_away_team_half_time_goals};;
  }

  measure: home_win_percent {
    type: number
    sql: (${home_wins}/${count_games})*100;;
    value_format:"0.00\%"
  }

  measure: test_gauge {
    type: number
    sql: (${home_wins}/${count_games})*100;;
    html: {{value}}<img src="https://chart.googleapis.com/chart?chs=500x300&cht=gom&chxt=y&chco=d84341,efb30e,f2f210,6fe043&chf=bg,s,FFFFFF00&chd=t:{{ value }}"/> ;;
  }

  measure: away_win_percent {
    type: number
    sql: (${away_wins}/${count_games})*100;;
    value_format:"0.00\%"
  }

  measure: draw_percent {
    type: number
    sql: (${draws}/${count_games})*100;;
    value_format:"0.00\%"
  }

  measure: avg_corners {
    type: number
    sql: avg(${away_team_corners}+${home_team_corners});;
    value_format: "0"
  }

  measure: avg_fouls {
    type: number
    sql: avg(${away_team_fouls}+${home_team_fouls});;
    value_format: "0"
  }

  measure: total_fouls {
    type: number
    sql: sum(${away_team_fouls}+${home_team_fouls});;
    value_format: "0"
  }


  measure: total_yellow_cards {
    type: number
    sql: sum(${away_team_yellow_cards}+${home_team_yellow_cards});;
    value_format: "0"
  }

  measure: total_red_cards {
    type: number
    sql: sum(${away_team_red_cards}+${home_team_red_cards});;
    value_format: "0"
  }

  measure: home_shots {
    type: number
    sql: sum(${home_team_shots});;
    value_format: "0"
  }
  measure: home_shots_on_target {
    type: number
    sql: sum(${home_team_shots_on_target});;
    value_format: "0"
  }

  measure: away_shots {
    type: number
    sql: sum(${away_team_shots});;
    value_format: "0"
  }
  measure: away_shots_on_target {
    type: number
    sql: sum(${away_team_shots_on_target});;
    value_format: "0"
    }
  measure: game_shot_accuracy {
    type: number
    sql: ((${away_shots_on_target}+${home_shots_on_target})/(${home_shots}+${away_shots}))*100;;
    value_format:"0.00\%"
  }
  measure: away_team_shot_accuracy {
    type: number
    sql: ((${away_shots_on_target})/(nullif(${away_shots}, 0)))*100;;
    value_format:"0.00\%"
  }
  measure: home_team_shot_accuracy {
    type: number
    sql: ((${home_shots_on_target})/(${home_shots}))*100;;
    value_format:"0.00\%"
  }
  measure: away_team_conversion_rate {
    type: number
    sql: ((${count_away_goals}/nullif(${away_shots}, 0)))*100;;
    value_format:"0.00\%"
  }
  measure: home_team_conversion_rate {
    type: number
    sql: (((${count_home_goals}/${home_shots})))*100;;
    value_format:"0.00\%"
  }

  measure: home_team_conversion_rate_test {
    type: string
    case: {
      when: {
        sql: (((${count_home_goals}/${home_shots})))*100 > 5.0;;
        label: "Home team winning"
      }
     }
    }

  measure: home_winning_at_half_time{
    description: "Home team winning at half time"
    type: yesno
    sql: ${home_team_half_time_goals}-${away_team_half_time_goals} > 0 ;;
  }




  dimension: win {
    type: number
    sql:if( ${full_time_score} = 'H',1,0);;
  }

  dimension: away_win {
    type: number
    sql:if( ${full_time_score} = 'A',1,0);;
  }



# # Filter
#   parameter: max_rank {
#     type: number
#   }
#
# # Group by max rank
#   dimension: rank_limit {
#     type: number
#     sql: {% parameter max_rank %} ;;
#   }

#   filter: show_top {
#     type: number
#   }

#   dimension: win {
#     type: number
#     sql: ${full_time_score};;
#   }
#

#   dimension: win {
#     type: number
#     sql:
#     CASE
#     WHEN ${full_time_score} = 'H' THEN 1
#     WHEN ${full_time_score} = 'A' THEN 2
#     WHEN ${full_time_score} = 'D' THEN 3
#     ELSE 9
#     END ;;
#   }

#   dimension: win{
#     type: number
#     case: {
#       when:{
#         sql: ${full_time_score} = 'H' ;;
#         label: "1"
#       }
#       when:{
#         sql: ${full_time_score} = 'A'  ;;
#         label:"2"
#       }
#       when:{
#         sql: ${full_time_score} = 'D'  ;;
#         label:"3"
#       }
#     }
#   }
}
