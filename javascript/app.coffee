`
#= require vendor/jquery.js
#= require vendor/underscore.js
#= require vendor/backbone.js
#= require vendor/socket.io.js
`

#= require namespace.coffee
#= require socket_connector

#= require_tree modules
#= require_tree views
# = require_tree models
# = require_tree collections





class Sockets.Router extends Backbone.Router

  initialize: ->
    @patients = new Sockets.Patients

    Backbone.history.start()

  routes:
    '' : 'index'

  index: ->
    @view = new Sockets.PatientList collection: @patients




window.app = new Sockets.Router
