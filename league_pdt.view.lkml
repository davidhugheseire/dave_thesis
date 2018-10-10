view: league_pdt {
    derived_table: {
      datagroup_trigger: league_pdt_datagroup
      explore_source: league_tables {
        column: team_id {}
        column: team {}
        column: season {}
        column: games_played {}
        column: goals_scored {}
        column: total_goals_against {}
        column: total_goal_difference {}
        column: league_wins {}
        column: league_draws {}
        column: league_losses {}
        column: best_league_position {}
        column: worst_league_position {}
        derived_column: win_percentage {
          sql: league_wins/ games_played *100;;
        }
        derived_column: lost_percentage {
          sql: league_losses/ games_played *100;;
        }
        derived_column: draw_percentage {
          sql: league_draws/ games_played *100;;
        }
      }
    }
    dimension: team_id {}
    dimension: team {}
    dimension: games_played {
      type: number
    }
    dimension: season {
    type: number
    }
    dimension: goals_scored {
      type: number
    }
    dimension: total_goals_against {
      type: number
    }
    dimension: total_goal_difference {
      type: number
    }
    dimension: league_wins {
      type: number
    }
    dimension: league_draws {
      type: number
    }
    dimension: league_losses {
      type: number
    }
    dimension: best_league_position {
      type: number
    }
    dimension: worst_league_position {
      type: number
    }
    dimension: lost_percentage {
      type: number
      value_format: "0.00\%"
    }
    dimension: draw_percentage {
      type: number
      value_format: "0.00\%"
    }
    measure: total_win_percentage {
    type: number
    sql: sum(win_percentage)/count(season) ;;
    value_format: "0.00\%"
    }

  }
