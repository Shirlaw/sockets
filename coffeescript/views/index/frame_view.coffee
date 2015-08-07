class Sockets.Index.FrameView extends Base.View

  template: templates.get(['index/frame.html'])
  id: 'index-frame'

  initialize: ->
    @_render()
    @_position()

  events:
    'click .new-patient' : 'new_patient'

  new_patient: ->
    @app.connector.create_patient()

  _render: ->
    @$el.html @template()
    @$container = @$('.container')

  _position: ->
    $('#app').html @$el
