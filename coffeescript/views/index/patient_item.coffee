class Sockets.PatientItem extends Base.View

  className: 'row'
  template: templates.get(['index/patient.html'])

  initialize: (options) ->
    @_render()
    @_position()

  events:
    'click .delete-patient' : 'delete_patient'

  delete_patient: ->
    @app.connector.delete_patient @model.id

  _render: ->
    @$el.html @template @model.toJSON()

  _position: ->
    @parent.$el.append @el
