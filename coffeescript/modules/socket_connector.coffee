class SocketConnector

  initialize: (options) ->
    @app = options.app
    @socket = io.connect("http://localhost:3700")

  index: ->
    @load_patients()
    @load_patient()
    # @listen_to_create()
    # @listen_to_delete()

  load_patients: ->
    @socket.on "patients", (data) =>
      @app.patients.reset data

  load_patient: ->
    @socket.on "load_patient", (data) =>
      @app.view.create_patient()

  create_patient: ->
    @socket.emit('create_patient')

  delete_patient: (id) ->
    @socket.emit('delete', { id: "#{id}" })
