class Base.View extends Backbone.View

  constructor: (options={}) ->
    @app = options.app
    @frame = options.frame
    @parent = options.parent

    super
