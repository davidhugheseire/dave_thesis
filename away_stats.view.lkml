# If necessary, uncomment the line below to include explore_source.
# include: "dave_football_thesis.model.lkml"

view: away_stats_pdt {
  derived_table: {
    explore_source: games {
      column: away_team_id {}
      column: away_team { field: game_stats.away_team }
      column: count_games { field: game_stats.count_games }
      column: away_shots { field: game_stats.away_shots }
      column: away_win_percent { field: game_stats.away_win_percent }
      column: away_shots_on_target { field: game_stats.away_shots_on_target }
      column: away_team_conversion_rate { field: game_stats.away_team_conversion_rate }
      column: away_team_shot_accuracy { field: game_stats.away_team_shot_accuracy }
      column: away_wins { field: game_stats.away_wins }
      column: both_team_score_percent { field: game_stats.both_team_score_percent }
      column: draw_percent { field: game_stats.draw_percent }
      column: avg_away_win_odds { field: odds.avg_away_win_odds }
      column: avg_home_win_odds { field: odds.avg_home_win_odds }
      column: avg_draw_odds { field: odds.avg_draw_odds }
      column: away_implied_probability { field: odds.away_implied_probability }
      column: home_win_implied_probability { field: odds.home_win_implied_probability }
      column: draw_implied_probability { field: odds.draw_implied_probability }
    }
    datagroup_trigger: league_pdt_datagroup
  }
  dimension: away_team_id {
    hidden: yes
  }
  dimension: away_team {
    hidden: yes
  }
  dimension: count_games {
    label: "Historic no of Away Games%"
    type: number
  }
  dimension: away_shots {
    label: "Historic Away Shots%"
    value_format: "0"
    type: number
  }
  dimension: away_win_percent {
    label: "Historic Away Win %"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_shots_on_target {
    label: "Historic Away Conversion Rate"
    value_format: "0"
    type: number
  }
  dimension: away_team_conversion_rate {
    label: "Historic Away Conversion Rate"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_team_shot_accuracy {
    label: "Historic Away Shot Accuracy"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_wins {
    label: "Historic Away Wins"
    type: number
  }
  dimension: both_team_score_percent {
    label: "Historic Both Scored Away"
    value_format: "0\%"
    type: number
  }
  dimension: draw_percent {
    label: "Historic Drawn % Away"
    value_format: "0.00\%"
    type: number
  }
  dimension: avg_away_win_odds {
    label: "Historic Win Odds Away"
    value_format: "0.00"
    type: number
  }
  dimension: avg_home_win_odds {
    label: "Historic Lose Odds Away"
    value_format: "0.00"
    type: number
  }
  dimension: avg_draw_odds {
    label: "Historic Draw Odds Away"
    value_format: "0.00"
    type: number
  }
  dimension: away_implied_probability {
    label: "Historic Win Probability Away"
    value_format: "0\%"
    type: number
  }
  dimension: home_win_implied_probability {
    label: "Historic lose Probability"
    value_format: "0\%"
    type: number
  }
  dimension: draw_implied_probability {
    label: "Historic Draw Probability Away"
    value_format: "0\%"
    type: number
  }
}
