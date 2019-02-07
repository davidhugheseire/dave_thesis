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


#   dimension: stadium_image {
#     type: string
#     sql: ${TABLE}.stadium ;;
#     html: {{linked_value}}
#         <a href="https://www.google.com/search?q={{ value }}" height="90%" width="90%" target="_new">
#         <img src="https://upload.wikimedia.org/wikipedia/commons/2/2d/Google-favicon-2015.png" height=15 width=15> </a> ;;
#   }

  dimension: stadium_images {
    type: string
    sql: ${TABLE}.team_name;;
    html:
    {% if {{value}} == "Manchester United" or {{value}} == "Man United" %}
    <img src="https://i2-prod.liverpoolecho.co.uk/incoming/article3004413.ece/ALTERNATES/s615/manchester-united-s-ground-old-trafford-620-640030011.jpg" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Liverpool" %}
    <img src="https://media-cdn.tripadvisor.com/media/photo-s/0c/ea/e3/5e/photo1jpg.jpg" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Chelsea" %}
    <img src="https://static.independent.co.uk/s3fs-public/thumbnails/image/2011/10/25/20/pg-78-chelsea-main-getty.jpg?w968h681" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Manchester City" %}
    <img src="https://goo.gl/pW1Ybq" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Arsenal" %}
    <img src="https://images.historicenglandservices.org.uk/p/106/emirates-stadium-arsenal-24985-021-1329910.jpg" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Aston Villa" %}
    <img src="https://t.resfu.com/media/img_news/fotografia-del-interior-de-villa-park--tottenhamhotspur.jpg" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Stoke" %}
    <img src="https://footballtripper.com/wp-content/uploads/2015/02/britannia-stadium-cover.jpg" width="90%" height="90%" align="middle"/>
    {% elsif {{value}} == "Newcastle" %}
    <img src="http://stadiumdb.com/pictures/stadiums/eng/st_james_park/st_james_park01.jpg" width="90%" height="90%" align="middle"/>
    {% endif %};;



  }

  dimension: Stadium {
    sql: ${TABLE}.stadium ;;
    html:
    <img src="https://guarded-sierra-37291.herokuapp.com/images.php?q={{ value | url_encode }}" alt="Not Found" /> ;;
  }

#   dimension: stadium_image  {
#     type: string
#     sql:  ${TABLE}.team_name ;;
#     html:
#     {% if {{value}} == "Arsenal" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t3.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Brighton" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t36.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Burnley" %}
#     <div><img src="" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Chelsea" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t8.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Crystal Palace" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t31.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Everton" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t11.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Huddersfield" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t38.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Leicester" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t13.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Liverpool" %}
#     <div><img src="https://media-cdn.tripadvisor.com/media/photo-s/0c/ea/e3/5e/photo1jpg.jpg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Man City" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t43.svg  " width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Man United" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t1.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Newcastle United" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t4.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Southampton" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t20.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Stoke" %}
#     <div><img src="https://cdn.shopify.com/s/files/1/1888/7339/files/Stoke_City_06_grande.jpg?v=1498033163" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Swansea City" %}
#     <div><img src="" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Tottenham" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t6.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Watford" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t57.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "West Bromwich Albion" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t35.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "West Ham United" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t21.svg" width="55%" height="55%" align="middle"/></div>
#     {% elsif {{value}} == "Wolverhampton Wanderers" %}
#     <div><img src="https://platform-static-files.s3.amazonaws.com/premierleague/badges/t39.svg" width="55%" height="55%" align="middle"/></div>
#     {% endif %} ;;
#   }

}
