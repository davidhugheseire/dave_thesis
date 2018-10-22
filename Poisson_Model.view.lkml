view: poisson_model {
    derived_table: {
      explore_source: games {
        column: home_team { field: game_stats.home_team }
        column: count_home_goals_hm { field: game_stats.count_home_goals }
        column: count_games_hm { field: game_stats.count_games }
        column: away_team { field: game_stats.away_team }
        column: count_away_goals_aw { field: game_stats.count_away_goals }
        column: count_games_aw { field: game_stats.count_games }
        column: league {}
        column: count_away_goals_lg { field: game_stats.count_away_goals }
        column: count_home_goals_lg { field: game_stats.count_home_goals }
        column: count_games_lg { field: game_stats.count_games }
        filters: {
          field: games.season
          value: "2017,2016,2015,2014,not 2018"
        }
      }
    }
  dimension: home_team {}
  dimension: away_team {}
  dimension: league {}
  dimension: count_home_goals {
      type: number
    }
  dimension: count_games {
      type: number
    }
  dimension: count_away_goals {
  type: number
  }
  dimension: count_home_goals_hm {
    type: number
  }
  dimension: count_away_goals_aw {
    type: number
  }
  dimension: count_away_goals_lg {
    type: number
  }
  dimension: count_home_goals_lg {
    type: number
  }
  }
