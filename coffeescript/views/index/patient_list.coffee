class Sockets.PatientList extends Base.View

  # className: ''


  initialize: (options) ->
    @listenTo @collection, 'reset', ->
      @_render_patients()
      @_position()

  _render_patients: ->
    @collection.each (model) =>
      @view = new Sockets.PatientItem model: model, parent: this

  _position: ->
    @frame.$container.html @el
