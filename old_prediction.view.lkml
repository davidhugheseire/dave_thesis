#######################TESTING INPUTS #############################
# Historic data
# you know the outcome
#
#
#
#
#
view: training_input {
  derived_table: {
    explore_source: games {
      column: id {}
      column: home_team { field: game_stats.home_team }
      column: away_team { field: game_stats.away_team }
      column: home_win_percent {field: features.home_win_percent}
      column: win_percent { field: features.win_percent }
      column: loss_percent { field: features.loss_percent }
      column: away_win_percent  {field: features.away_win_percent}
      column: home_win_implied_probability {field: features.home_win_implied_probability}
      column: away_implied_probability {field: features.away_implied_probability}
      column: win { field: game_stats.win }
      filters: {
        field: games.season
        value: "2008,2009,2010,2011"
      }
    }
  }
}



#######################TRAINING INPUTS #############################
#Training Data different partition range of data
#
#
#
#
#
view: testing_input {
  derived_table: {
    explore_source: games {
    column: id {}
      column: home_team { field: game_stats.home_team }
      column: away_team { field: game_stats.away_team }
      column: home_win_percent {field: features.home_win_percent}
      column: win_percent { field: features.win_percent }
      column: loss_percent { field: features.loss_percent }
      column: away_win_percent  {field: features.away_win_percent}
      column: home_win_implied_probability {field: features.home_win_implied_probability}
      column: away_implied_probability {field: features.away_implied_probability}
      column: win { field: game_stats.win }
      filters: {
        field: games.season
        value: "2012,2013,2014,2015,2016,2017"
      }
    }
  }
}



#######################MODEL #############################
# Algorythm logistic regression, binary outcome, linear reg for range
# Column we are predicting
# Measure of improvment if it doesnt improve more than 0.005 quit
# Iterate through the algorythm 40 times
#
#
#
#
#
view: win_model {
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='logistic_reg'
        , labels=['win']
  --      , class_weights=[('win', 0.6), ('draw', 0.4), ('lose', 0.2)]
        , min_rel_progress = 0.005
        , max_iterations = 40
        ) AS
      SELECT
        * EXCEPT(id)
      FROM ${training_input.SQL_TABLE_NAME};;
  }
}

#######################MODEL EVALUATION INFORMATION #############################
# Functions for evaluating the model
# Takes our model as input,  the model we created above
# test it against out testing dataset
#
#
#
#
#
explore: win_model_evaluation {}
explore: win_model_training_info {}
explore: roc_curve {}
explore: win_model {}
explore: future_win_prediction {}

#######################MODEL EVALUATION ##############################
view: win_model_evaluation {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${win_model.SQL_TABLE_NAME},
          (SELECT * FROM ${testing_input.SQL_TABLE_NAME}));;
  }

  dimension: recall {
    type: number
    value_format_name:percent_2
    }

  dimension: accuracy {
    type: number
    value_format_name:percent_2
    }

  dimension: f1_score {
    type: number
    value_format_name:percent_3
    }

  dimension: log_loss {
    type: number
    }

  dimension: roc_auc {
    type: number
    }
}

#######################MODEL EVALUATION ##############################
view: roc_curve {
  derived_table: {
    sql: SELECT * FROM ml.ROC_CURVE(
        MODEL ${win_model.SQL_TABLE_NAME},
        (SELECT * FROM ${testing_input.SQL_TABLE_NAME}));;
  }

  dimension: threshold {
    type: number
    value_format: "0.00\%"
    link: {
      label: "Likely to Win"
      url: "/explore/dave_football_thesis/games?fields=future_fixtures.week_of_the_year,future_fixtures.home_team,future_fixtures.away_team,future_win_prediction.max_predicted_score&f[future_win_prediction.predicted_win]=%3E%3D{{value}}"
    icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: recall {
    type: number
    value_format_name: percent_2
    }

  dimension: false_positive_rate {
    type: number
    }

  dimension: true_positives {
    type: number
    }

  dimension: false_positives {
    type: number
    }

  dimension: true_negatives {
    type: number
    }

  dimension: false_negatives {
    type: number
    }

  dimension: precision {
    type:  number
    value_format_name: percent_2
    sql:  ${true_positives} / NULLIF((${true_positives} + ${false_positives}),0);;
  }

  measure: total_false_positives {
    type: sum
    sql: ${false_positives} ;;
  }
  measure: total_true_positives {
    type: sum
    sql: ${true_positives} ;;
  }
  dimension: threshold_accuracy {
    type: number
    value_format_name: percent_2
    sql:  1.0*(${true_positives} + ${true_negatives}) / NULLIF((${true_positives} + ${true_negatives} + ${false_positives} + ${false_negatives}),0);;
  }
  dimension: threshold_f1 {
    type: number
    value_format_name: percent_3
    sql: 2.0*${recall}*${precision} / NULLIF((${recall}+${precision}),0);;
  }
}



#######################TRAINING INFORMATION #############################
# Less about how the mosel performed and more about
# How long it took to train
# How many iteration it took
# How much did it improve over thoes iterations
#
#
#
#
#
view: win_model_training_info {
  derived_table: {
    sql: SELECT  * FROM ml.TRAINING_INFO(MODEL ${win_model.SQL_TABLE_NAME});;
  }


  dimension: training_run {
    type: number
  }
  dimension: iteration {
    type: number
  }
  dimension: loss_raw {
    type: number hidden:yes
    sql: ${TABLE}.loss;;
  }
  dimension: eval_loss {
    type: number
  }
  dimension: duration_ms {
    label:"Duration (ms)" type: number
  }
  dimension: learning_rate {
    type: number
  }
  measure: total_iterations {
    type: count
  }
  measure: loss {
    value_format_name: decimal_2
    type: sum
    sql:  ${loss_raw} ;;
  }
  measure: total_training_time {
    type: sum
    label:"Total Training Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  measure: average_iteration_time {
    type: average
    label:"Average Iteration Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
}



#########################################PREDICT FUTURE ############################
#
#
#
#
#
view: future_input {
  derived_table: {
    explore_source: games {
      column: id {field: future_fixtures.match_index}
      column: home_team { field: future_fixtures.home_team }
      column: away_team { field: future_fixtures.away_team }
      column: home_win_percent {field: features.home_win_percent}
      column: win_percent { field: features.win_percent }
      column: loss_percent { field: features.loss_percent }
      column: away_win_percent  {field: features.away_win_percent}
      column: home_win_implied_probability {field: features.home_win_implied_probability}
      column: away_implied_probability {field: features.away_implied_probability}
      filters: {
        field: future_fixtures.season
        value: "2018"
      }
    }
  }
}


view: future_win_prediction {
  derived_table: {
    sql: SELECT * FROM ml.PREDICT(
          MODEL ${win_model.SQL_TABLE_NAME},
          (SELECT * FROM ${future_input.SQL_TABLE_NAME}));;
  }

  dimension: id {
    primary_key: yes
    hidden:yes
    type: number
  }

  dimension: predicted_win {
    type: number
  }


  measure: max_predicted_score {
    type: max
    value_format_name: percent_2
    sql: ${predicted_win} ;;
  }

  measure: average_predicted_score {
    type: average
    value_format_name: percent_2
    sql: ${predicted_win} ;;
  }
}
