# If necessary, uncomment the line below to include explore_source.
# include: "dave_football_thesis.model.lkml"

view: home_stats_pdt {
  derived_table: {
    explore_source: games {
      column: home_team_id {}
      column: home_team { field: game_stats.home_team }
      column: count_games { field: game_stats.count_games }
      column: home_shots { field: game_stats.home_shots }
      column: home_win_percent { field: game_stats.home_win_percent }
      column: home_shots_on_target { field: game_stats.home_shots_on_target }
      column: home_team_conversion_rate { field: game_stats.home_team_conversion_rate }
      column: home_team_shot_accuracy { field: game_stats.home_team_shot_accuracy }
      column: home_wins { field: game_stats.home_wins }
      column: both_team_score_percent { field: game_stats.both_team_score_percent }
      column: draw_percent { field: game_stats.draw_percent }
      column: avg_home_win_odds { field: odds.avg_home_win_odds }
      column: avg_away_win_odds { field: odds.avg_away_win_odds }
      column: avg_draw_odds { field: odds.avg_draw_odds }
      column: home_win_implied_probability { field: odds.home_win_implied_probability }
      column: away_implied_probability { field: odds.away_implied_probability }
      column: draw_implied_probability { field: odds.draw_implied_probability }
    }
    datagroup_trigger: league_pdt_datagroup
  }
  dimension: home_team_id {}
  dimension: home_team {}
  dimension: count_games {
    label: "Historic no of Home Games%"
    type: number
  }
  dimension: home_shots {
    label: "Historic Home Shots"
    value_format: "0"
    type: number
  }
  dimension: home_win_percent {
    label: "Historic Home Win %"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_shots_on_target {
    label: "Historic Home Shots on Target"
    value_format: "0"
    type: number
  }
  dimension: home_team_conversion_rate {
    label: "Historic Home Conversion Rate"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_team_shot_accuracy {
    label: "Historic Home Shot Accuracy"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_wins {
    label: "Historic Home Wins"
    type: number
  }
  dimension: both_team_score_percent {
    label: "Historic Both Scored % Home"
    value_format: "0\%"
    type: number
  }
  dimension: draw_percent {
    label: "Historic Drawn % Home"
    value_format: "0.00\%"
    type: number
  }
  dimension: avg_home_win_odds {
    label: "Historic Win Odds Home"
    value_format: "0.00"
    type: number
  }
  dimension: avg_away_win_odds {
    label: "Historic Lose Odds Home"
    value_format: "0.00"
    type: number
  }
  dimension: avg_draw_odds {
    label: "Historic Draw Odds Home"
    value_format: "0.00"
    type: number
  }
  dimension: home_win_implied_probability {
    label: "Historic win probability Home"
    value_format: "0\%"
    type: number
  }
  dimension: away_implied_probability {
    label: "Hostoric Lose probability Home"
    value_format: "0\%"
    type: number
  }
  dimension: draw_implied_probability {
    label: "Historic Draw Probability Home"
    value_format: "0\%"
    type: number
  }
}
