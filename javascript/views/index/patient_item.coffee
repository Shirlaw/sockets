class Sockets.PatientItem extends Base.View

  tagName: 'li'
  template: templates.get(['patient_item.html'])

  initialize: (options) ->
    @parent = options.parent

    @_render()
    @_position()

  events:
    'click .delete' : 'delete'

  delete: ->
    socket.emit('delete', { id: "#{@model.id}" })

  _render: ->
    @$el.html @template @model.toJSON()

  _position: ->
    @parent.$patient_list.append @el
