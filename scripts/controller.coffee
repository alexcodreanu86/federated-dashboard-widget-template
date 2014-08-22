namespace('WidgetTemplate')

class WidgetTemplate.Controller
  @setupWidgetIn: (settings) ->
    templateHtml = WidgetTemplate.Templates.renderForm()
    $(settings.container).html(templateHtml)

  @hideForms: ->
    $('[data-id=template-form]').hide()
    $('.widget-close').hide()

  @showForms: ->
    $('[data-id=template-form]').show()
    $('.widget-close').show()
