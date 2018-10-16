# If necessary, uncomment the line below to include explore_source.
# include: "dave_football_thesis.model.lkml"

view: fixtures_team_v_team {
  derived_table: {
    explore_source: games {
      column: home_team { field: game_stats.home_team }
      column: away_team { field: game_stats.away_team }
      column: full_time_score { field: game_stats.full_time_score }
      column: home_shots { field: game_stats.home_shots }
      column: home_shots_on_target { field: game_stats.home_shots_on_target }
      column: home_team_shot_accuracy { field: game_stats.home_team_shot_accuracy }
      column: home_team_conversion_rate { field: game_stats.home_team_conversion_rate }
      column: away_shots { field: game_stats.away_shots }
      column: away_shots_on_target { field: game_stats.away_shots_on_target }
      column: away_team_shot_accuracy { field: game_stats.away_team_shot_accuracy }
      column: away_team_conversion_rate { field: game_stats.away_team_conversion_rate }
      column: both_teams_scored { field: game_stats.both_teams_scored }
      column: count_games { field: game_stats.count_games }
    }
    datagroup_trigger: league_pdt_datagroup
  }
  dimension: home_team {}
  dimension: away_team {}
  dimension: full_time_score {}
  dimension: home_shots {
    value_format: "0"
    type: number
  }
  dimension: home_shots_on_target {
    value_format: "0"
    type: number
  }
  dimension: home_team_shot_accuracy {
    value_format: "0.00\%"
    type: number
  }
  dimension: home_team_conversion_rate {
    value_format: "0.00\%"
    type: number
  }
  dimension: away_shots {
    value_format: "0"
    type: number
  }
  dimension: away_shots_on_target {
    value_format: "0"
    type: number
  }
  dimension: away_team_shot_accuracy {
    value_format: "0.00\%"
    type: number
  }
  dimension: away_team_conversion_rate {
    value_format: "0.00\%"
    type: number
  }
  dimension: both_teams_scored {
    type: number
  }
  dimension: count_games {
    type: number
  }
}
