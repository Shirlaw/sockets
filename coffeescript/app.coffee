`
#= require vendor/jquery.js
#= require vendor/underscore.js
#= require vendor/backbone.js
#= require vendor/socket.io.js
`
#= require namespace.coffee
#= require_tree extenders
#= require socket_connector
#= require_tree modules
#= require_tree views
#= require_tree models
#= require_tree collections

class Sockets.Router extends Backbone.Router

  initialize: ->
    @patients = new Sockets.Patients
    @connector = new SocketConnector
    @connector.initialize app: this
    Backbone.history.start()

  routes:
    '' : 'index'

  index: ->
    @connector.index()
    # @connector.load_patients()
    # @connector.load_patient()
    # @connector.listen_for_delete()
    @frame = new Sockets.Index.FrameView app: this
    @view = new Sockets.PatientList collection: @patients, app: this, frame: @frame




window.app = new Sockets.Router
