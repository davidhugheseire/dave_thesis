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
  dimension: away_team_id {}
  dimension: away_team {}
  dimension: count_games {
    type: number
  }
  dimension: away_shots {
    value_format: "0"
    type: number
  }
  dimension: away_win_percent {
    value_format: "0.00\%"
    type: number
  }
  dimension: away_shots_on_target {
    value_format: "0"
    type: number
  }
  dimension: away_team_conversion_rate {
    value_format: "0.00\%"
    type: number
  }
  dimension: away_team_shot_accuracy {
    value_format: "0.00\%"
    type: number
  }
  dimension: away_wins {
    type: number
  }
  dimension: both_team_score_percent {
    value_format: "0\%"
    type: number
  }
  dimension: draw_percent {
    value_format: "0.00\%"
    type: number
  }
  dimension: avg_away_win_odds {
    value_format: "0.00"
    type: number
  }
  dimension: avg_home_win_odds {
    value_format: "0.00"
    type: number
  }
  dimension: avg_draw_odds {
    value_format: "0.00"
    type: number
  }
  dimension: away_implied_probability {
    label: "Odds away win implied probability"
    value_format: "0\%"
    type: number
  }
  dimension: home_win_implied_probability {
    label: "Odds home win implied probability"
    value_format: "0\%"
    type: number
  }
  dimension: draw_implied_probability {
    label: "Odds draw implied probability"
    value_format: "0\%"
    type: number
  }
}
