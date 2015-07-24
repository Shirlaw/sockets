class Sockets.PatientItem extends Base.View

  className: 'row'
  template: templates.get(['index/patient.html'])

  initialize: (options) ->
    console.log 'ahh'
    @parent = options.parent

    @_render()
    @_position()

  events:
    'click .delete-patient' : 'delete_patient'

  delete_patient: ->
    console.log 'here'
    socket.emit('delete', { id: "#{@model.id}" })

  _render: ->
    @$el.html @template @model.toJSON()

  _position: ->
    @parent.$el.append @el
