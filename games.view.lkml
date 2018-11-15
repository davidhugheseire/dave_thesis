view: games {
  sql_table_name: dave_thesis.games ;;




  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
      quarter,
      year,
      month_name,
      day_of_month,
      day_of_week,
      week_of_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: day_of_week {
    sql: extract(DAYOFWEEK from ${date_date}) ;;
    label: "Day of Week"
  }






  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }
  measure: measure_division {
    type: string
    sql: count(${TABLE}.division) ;;
  }

  dimension: home_team_id {
    type: string
    sql: ${TABLE}.home_team_id ;;
  }

  dimension: league {
    type: string
    sql: ${TABLE}.league ;;
  }

  dimension: League_name {
    label: "League Image"
    type: string
    sql: ${TABLE}.league ;;
    html:
      {% if {{value}} == "Premier League" %}
      <div><img src="https://s3.amazonaws.com/freebiesupply/large/2x/premier-league-logo-png-transparent.png" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == "Championship" %}
      <div><img src="http://worldsoccertalk.com/wp-content/uploads/2014/01/championship-logo.jpg" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == "League 1" %}
      <div><img src="https://www.pes-patch.com/wp-content/uploads/2016/10/PES2017-PS4-OF-2016-17-EFL-League-1-by-Blur.png" width="55%" height="55%" align="middle"/></div>
     {% elsif {{value}} == "League 2" %}
      <div><img src="https://www.thesportsdb.com/images/media/league/logo/wruwrv1467458767.png" width="55%" height="55%" align="middle"/></div>
      {% endif %}
      ;;
  }

  dimension: match_index {
    type: number
    sql: ${TABLE}.match_index ;;
  }

  dimension: referee {
    type: string
    sql: ${TABLE}.referee ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }





}
