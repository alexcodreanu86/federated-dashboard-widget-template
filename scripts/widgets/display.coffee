namespace('WidgetTemplate.Widgets')

class WidgetTemplate.Widgets.Display
  constructor: (@settings) ->
    @container = @settings.container

  initialize: ->
    @setupForm()

  setupForm: ->
    $(@container).html(WidgetTemplate.Widgets.Templates.renderForm())

  getInput: ->
    $("#{@container} [name=widget-input]").val()

## Add your methods from here:
  showText: (text) ->
    formatedText = WidgetTemplate.Widgets.Templates.wrapText(text)
    $("#{@container} [data-name=widget-output]").append(formatedText)

  removeWidget: ->
    $(@container).remove()
