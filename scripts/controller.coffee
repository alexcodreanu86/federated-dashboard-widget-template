namespace('WidgetTemplate')

class WidgetTemplate.Controller
  @setupWidgetIn: (settings) ->
    new WidgetTemplate.Widgets.Controller(settings).initialize()
