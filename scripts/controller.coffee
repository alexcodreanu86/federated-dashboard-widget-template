namespace('WidgetTemplate')

class WidgetTemplate.Controller
  @setupWidgetIn: (settings) ->
    templateHtml = WidgetTemplate.Templates.renderForm()
    $(settings.container).html(templateHtml)
