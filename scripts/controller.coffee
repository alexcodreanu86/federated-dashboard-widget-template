namespace('WidgetTemplate')

class WidgetTemplate.Controller
  @setupWidgetIn: (settings) ->
    templateHtml = WidgetTemplate.Templates.renderForm()
    $(settings.container).html(templateHtml)

  @exitEditMode: ->
    $('[data-id=template-form]').hide()
    $('.widget-close').hide()

  @enterEditMode: ->
    $('[data-id=template-form]').show()
    $('.widget-close').show()
