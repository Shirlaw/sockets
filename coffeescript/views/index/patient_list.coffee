class Sockets.PatientList extends Base.View

  # className: ''

  initialize: (options) ->
    @listenTo @collection, 'reset', ->
      @_render_patients()
      @_position()

  _render_patients: ->
    @collection.each (model) =>
      @render_patient model

  render_patient: (model) ->
    @view = new Sockets.PatientItem model: model, parent: this, app: @app

  create_patient: (attributes) ->
    model = new Sockets.Patient attributes
    @render_patient model

  _position: ->
    @frame.$container.html @el
