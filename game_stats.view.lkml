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
  }

  dimension: away_team_corners {
    type: number
    sql: ${TABLE}.away_team_corners ;;
  }

  dimension: away_team_fouls {
    type: number
    sql: ${TABLE}.away_team_fouls ;;
  }

  dimension: away_team_goals {
    type: number
    sql: ${TABLE}.away_team_goals ;;
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
    drill_fields: [id]
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
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "Away team Won" %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: black; background-color: lightyellow; font-size:100%; text-align:center">{{ rendered_value }}</p>
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


  dimension: both_teams_score {
    type: yesno
    sql: ${home_team_goals} > 0 and ${away_team_goals} > 0  ;;
  }

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
    sql: ${game_stats.id} ;;
   drill_fields: [games.date_raw,home_team,away_team,home_team_goals,away_team_goals,odds.home_win_odds]
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

  measure: home_come_back {
    type: number
    sql: ${count_away_team_half_time_goals}-${count_home_team_half_time_goals};;
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
  measure: both_team_score_percent {
    type: number
    sql: (${both_teams_scored}/${count_games})*100;;
    value_format:"0\%"
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
  measure: home_shots_on_target {
    type: number
    sql: sum(${home_team_shots_on_target});;
    value_format: "0"
  }
  measure: home_shots {
    type: number
    sql: sum(${home_team_shots});;
    value_format: "0"
  }

}
