view: club {
  sql_table_name: dave_thesis.club ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: stadium {
    type: string
    sql: ${TABLE}.stadium ;;
  }

  dimension: stadium_id {
    type: string
    sql: ${TABLE}.stadium_id ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: team_id {
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.team_name ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude};;
  }

  measure: count {
    type: count
    drill_fields: [team_name]
  }

  dimension: stadium_image  {
    type: string
    sql:  ${TABLE}.team_name ;;
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
    <div><img src="https://media-cdn.tripadvisor.com/media/photo-s/0c/ea/e3/5e/photo1jpg.jpg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Man City" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t43.svg  " width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Man United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t1.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Newcastle United" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t4.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Southampton" %}
    <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t20.svg" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Stoke" %}
    <div><img src="https://cdn.shopify.com/s/files/1/1888/7339/files/Stoke_City_06_grande.jpg?v=1498033163" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Swansea City" %}
    <div><img src="" width="55%" height="55%" align="middle"/></div>
    {% elsif {{value}} == "Tottenham" %}
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
