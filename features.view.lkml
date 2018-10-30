# If necessary, uncomment the line below to include explore_source.
# include: "dave_football_thesis.model.lkml"

view: features {
  derived_table: {
    explore_source: games {
      column: id                            { field: game_stats.id}
      column: season                        { field: games.season}
      column: home_team                     { field: game_stats.home_team }
      column: away_team                     { field: game_stats.away_team }
      column: home_wins                     { field: fixture_history_pdt.home_wins }
      column: away_wins                     { field: fixture_history_pdt.away_wins }
      column: home_shot_accuracy            { field: home_stats_pdt.home_team_shot_accuracy }
      column: home_conversion_rate          { field: home_stats_pdt.home_team_conversion_rate }
      column: home_win_percent              { field: home_stats_pdt.home_win_percent }
      column: away_win_percent              { field: away_stats_pdt.away_win_percent }
      column: home_win_implied_probability  { field: home_stats_pdt.home_win_implied_probability }
      column: away_implied_probability      { field: away_stats_pdt.away_implied_probability }
      column: loss_percent                  { field: fixture_history_pdt.Away_win_percent }
      column: win_percent                   { field: fixture_history_pdt.home_win_percent }
      column: win_probability               { field: fixture_history_pdt.home_win_implied_probability }
      column: conversion_rate               { field: fixture_history_pdt.home_team_conversion_rate }
      column: win                           { field: game_stats.win }
    }
  }
  dimension: id {
    primary_key: yes
  }
  dimension: home_team {}
  dimension: away_team {}
  dimension: season {}
  dimension: home_shot_accuracy {
    label: "Home Stats Pdt Historic Home Shot Accuracy"
    value_format: "0.00\%"
    type: number
  }

  dimension: home_win_percent {
    label: "Historic Win %"
    value_format: "0.00\%"
    type: number
  }
  dimension: away_win_percent {
    label: "Historic Loss %"
    value_format: "0.00\%"
    type: number
  }
  dimension: home_win_implied_probability {
    label: "Historic win probability"
    value_format: "0\%"
    type: number
  }

  dimension: home_conversion_rate {
    label: "Historic conversion_rate"
    value_format: "0\%"
    type: number
  }
  dimension: away_implied_probability {
    label: "Historic Loss Probability"
    value_format: "0\%"
    type: number
  }
  dimension: loss_percent {
    label: "Fixture Loss %"
    value_format: "0.00\%"
    type: number
  }
  dimension: win_probability {
    label: "Fixture Win Probability"
    value_format: "0\%"
    type: number
  }
  dimension: home_wins {
    label: "Fixture Home Wins"
    type: number
  }
  dimension: away_wins {
    label: "Fixture Losses"
    type: number
  }
  dimension: win_percent {
    label: "Fixture Win %"
    value_format: "0.00\%"
    type: number
  }
  dimension: conversion_rate {
    label: "Fixture Conversion Rate"
    value_format: "0.00\%"
    type: number
  }
  dimension: win {
    label: "Win"
    type: number
  }
}
