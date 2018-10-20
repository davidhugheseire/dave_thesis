# If necessary, uncomment the line below to include explore_source.
# include: "dave_football_thesis.model.lkml"

view: fixture_history_pdt {
  derived_table: {
    explore_source: games {
      column: home_team_id {}
      column: home_team { field: game_stats.home_team }
      column: away_team { field: game_stats.away_team }
      column: away_team_id {}
      column: count_games { field: game_stats.count_games }
      column: home_wins { field: game_stats.home_wins }
      column: away_wins { field: game_stats.away_wins }
      column: draws { field: game_stats.draws }
      column: home_win_percent { field: game_stats.home_win_percent }
      column: home_shots_on_target { field: game_stats.home_shots_on_target }
      column: home_team_shot_accuracy { field: game_stats.home_team_shot_accuracy }
      column: home_team_conversion_rate { field: game_stats.home_team_conversion_rate }
      column: home_shots { field: game_stats.home_shots }
      column: away_win_percent { field: game_stats.away_win_percent }
      column: away_shots_on_target { field: game_stats.away_shots_on_target }
      column: away_team_shot_accuracy { field: game_stats.away_team_shot_accuracy }
      column: away_team_conversion_rate { field: game_stats.away_team_conversion_rate }
      column: away_shots { field: game_stats.away_shots }
      column: draw_percent { field: game_stats.draw_percent }
      column: both_team_score_percent { field: game_stats.both_team_score_percent }
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
  dimension: away_team {}
  dimension: away_team_id {}
  dimension: count_games {
    label: "Fixture no. Games"
    type: number
  }
  dimension: home_wins {
    label: "Fixture Home Wins"
    type: number
  }
  dimension: away_wins {
    label: "Fixture Away Wins"
    type: number
  }
  dimension: draws {
    label: "Fixture Draws"
    type: number
  }
  dimension: home_win_percent {
    label: "Fixture Home Win %"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_shots_on_target {
    label: "Fixture Shots on Target"
    value_format: "0"
    type: number
  }
  dimension: home_team_shot_accuracy {
    label: "Fixture Home Shot Accuracy"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_team_conversion_rate {
    label: "Fixture Home Conversion Rate"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_shots {
    label: "Fixture Home Shots"
    value_format: "0"
    type: number
  }
  dimension: Away_win_percent {
    label: "Fixture Away Win %"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_shots_on_target {
    label: "Fixture Away Shots on Target"
    value_format: "0"
    type: number
  }
  dimension: away_team_shot_accuracy {
    label: "Fixture Away Shot Accuracy"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_team_conversion_rate {
    label: "Fixture Away Conversion Rate"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_shots {
    label: "Fixture Away Shots"
    value_format: "0"
    type: number
  }
  dimension: draw_percent {
    label: "Fixture Draw %"
    value_format: "0.00\%"
    type: number
  }
  dimension: both_team_score_percent {
    label: "Fixture Both Scored %"
    value_format: "0\%"
    type: number
  }
  dimension: avg_home_win_odds {
    label: "Fixture Both Scored %"
    value_format: "0.00"
    type: number
  }
  dimension: avg_away_win_odds {
    label: "Fixture Away Win Odds"
    value_format: "0.00"
    type: number
  }
  dimension: avg_draw_odds {
    label: "Fixture Draw Odds"
    value_format: "0.00"
    type: number
  }
  dimension: home_win_implied_probability {
    label: "Fixture Home Win Implied Probability"
    value_format: "0\%"
    type: number
  }
  dimension: away_implied_probability {
    label: "Fixture Away Win Implied Probability"
    value_format: "0\%"
    type: number
  }
  dimension: draw_implied_probability {
    label: "Fixture Draw Implied Probability"
    value_format: "0\%"
    type: number
  }
}
