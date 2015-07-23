class Sockets.PatientList extends Base.View

  template: templates.get(['patient_list.html'])

  initialize: (options) ->
    @listenTo @collection, 'reset', ->

      @_render_list()
      @_render_all()

      @_position()

  _render_list: ->
    @$el.html @template()
    @$patient_list = @$('ul.patient_list')

  _render_all: ->
    @collection.each (model) =>
      @view = new Sockets.PatientItem model: model, parent: this

  _position: ->
    $('#app').html @el
