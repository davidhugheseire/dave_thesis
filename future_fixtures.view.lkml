view: future_fixtures {
  sql_table_name: dave_thesis.future_fixtures ;;

  dimension: away_team {
    type: string
    sql: ${TABLE}.away_team ;;
  }

  dimension: away_team_id {
    type: string
    sql: ${TABLE}.away_team_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      week_of_year,
      quarter,
      year,
      day_of_week
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: fixture {
    type: string
    sql: ${TABLE}.fixture ;;
    label: "Fixture"
        link: {
          label: "Fixture Dashboard"
          url: "https://productday.dev.looker.com/dashboards/246?Home%20Team={{ future_fixtures.home_team }}&Away%20Team={{ future_fixtures.away_team | url_encode }}"
        }
      }

  measure: vis {
    case: {
      when: {
        sql: away_win_prediction.predicted_away_win = 1 ;;
      label: "2"}
    when: {
      sql: home_win_prediction.predicted_home_win = 1 ;;
      label: "1"}
    when: {
      sql: home_win_prediction.predicted_home_win = 0 and away_win_prediction.predicted_away_win = 0 ;;
      label: "3"}
  }
}


  dimension: home_team {
    type: string
    sql: ${TABLE}.home_team ;;
    label: "Home Team"
    link: {
      label: "Team Dashboard"
      #url: "https://productday.dev.looker.com/dashboards/246?Home%20Team={{ future_fixtures.home_team }}&Away%20Team={{ future_fixtures.away_team | url_encode }}"
      url: "https://productday.dev.looker.com/dashboards/239?Team={{ _filters['future_fixtures.home_team'] }}&Away%20Team={{ _filters['future_fixtures.home_team']  | url_encode }}"
    }
  }

  dimension: home_team_id {
    type: string
    sql: ${TABLE}.home_team_id ;;
  }

  dimension: match_index {
    type: string
    sql: ${TABLE}.match_index ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: stadium {
    type: string
    sql: ${TABLE}.stadium ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


  dimension: home_team_image  {
    description: "Home Team Crest"
    type: string
    sql:  ${TABLE}.home_team ;;
    html:
    {% if {{value}} == "Arsenal" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t3.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Brighton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t36.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Burnley" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Chelsea" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t8.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Crystal Palace" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t31.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Everton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t11.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Huddersfield" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t38.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Leicester" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t13.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Liverpool" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t14.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Manchester City" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t43.svg  " width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Manchester United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t1.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Newcastle" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t4.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Southampton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t20.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Stoke" %}
    <div><img src="https://cdn.shopify.com/s/files/1/1888/7339/files/Stoke_City_06_grande.jpg?v=1498033163" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Swansea City" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Tottenham Hotspur" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t6.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Watford" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t57.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Bromwich Albion" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t35.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Ham United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t21.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Wolverhampton Wanderers" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t39.svg" width="55%" height="55%" align="middle"/></div>
    {% endif %} ;;
  }
#<div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t14.svg" width="55%" height="55%" align="middle"/></div>
  dimension: away_team_image  {
    description: "Away Team Crest"
    type: string
    sql:  ${TABLE}.away_team ;;
    html:
    {% if {{value}} == "Arsenal" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t3.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Brighton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t36.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Burnley" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Chelsea" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t8.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Crystal Palace" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t31.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Everton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t11.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Huddersfield" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t38.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Leicester" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t13.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Liverpool" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t14.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Manchester City" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t43.svg  " width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Manchester United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t1.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Newcastle United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t4.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Southampton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t20.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Stoke" %}
    <div><img src="https://cdn.shopify.com/s/files/1/1888/7339/files/Stoke_City_06_grande.jpg?v=1498033163" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Swansea City" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Tottenham Hotspur" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t6.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Watford" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t57.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Bromwich Albion" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t35.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "West Ham United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t21.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Wolverhampton Wanderers" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t39.svg" width="55%" height="55%" align="middle"/></div>
    {% endif %} ;;
  }



}
