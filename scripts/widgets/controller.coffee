namespace('WidgetTemplate.Widgets')

class WidgetTemplate.Widgets.Controller
  constructor: (@settings) ->
    @container = @settings.container
    @display = new WidgetTemplate.Widgets.Display(@settings)

  initialize: ->
    @display.initialize()
    @bind()

  bind: ->
    $("#{@container} [data-name=widget-close]").on 'click', => @closeWidget()

    $("#{@container} [data-name=widget-form]").on 'submit', (event) =>
      event.preventDefault()
      @processFormSubmission()

  closeWidget: ->
    @unbind()
    @display.removeWidget()

  unbind: ->
    $("#{@container} [data-name=widget-form]").unbind('submit')
    $("#{@container} [data-name=widget-close]").unbind('click')

  processFormSubmission: ->
    input = @display.getInput()
    # here is where the magic happens
    # make your widget do whatever you want with this input
    # in this case it will be printed out
    @display.showText(input)
