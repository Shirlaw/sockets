class SocketConnector

  init_connection: ->
    @socket = io.connect("http://localhost:3700")

  load_patients: ->
    @socket.on "patients", (data) ->
      app.patients.reset data
