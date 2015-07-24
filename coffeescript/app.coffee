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
    @connector = new SocketConnector
    @connector.init_connection()
    @patients = new Sockets.Patients
    Backbone.history.start()

  routes:
    '' : 'index'

  index: ->
    @connector.load_patients()
    @frame = new Sockets.Index.FrameView app: this
    @view = new Sockets.PatientList collection: @patients, app: this, frame: @frame

    # @frame = @render_frame Sockets.Index.FrameView app: @
    # @view = @render_view Sockets.PatientList collection: @patients




window.app = new Sockets.Router
