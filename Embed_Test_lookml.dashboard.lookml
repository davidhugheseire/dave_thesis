- dashboard: Embed_Test_lookml
  title: Embed Test
  layout: newspaper
  embed_style:
  background_color: "#ffffff"
  show_title: false
  title_color: "#000000"
  show_filters_bar: false
  tile_text_color: "#3e3f40"
  text_tile_text_color: "#ffffff"
  elements:
  - name: ' '
    note_display: above
    note_text: Top blacklisted callers in the last 7 days
    model: dave_football_thesis
    explore: games
    type: looker_bar
    fields: [games.count, games.home_team_id]
    sorts: [games.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 0
    col: 0
    width: 13
    height: 15
  - name: ''
    note_display: above
    note_text: Top repeat callers in last 7 days
    model: dave_football_thesis
    explore: games
    type: looker_bar
    fields: [games.count, games.away_team_id]
    sorts: [games.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 0
    col: 13
    width: 11
    height: 15
