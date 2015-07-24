class Sockets.Index.FrameView extends Base.View

  template: templates.get(['index/frame.html'])
  id: 'index-frame'

  initialize: ->
    @_render()
    @_position()

  _render: ->
    @$el.html @template()
    @$container = @$('.container')

  _position: ->
    $('#app').html @$el
