namespace('WidgetTemplate')

class WidgetTemplate.Display
  @generateLogo: (config) ->
    "<i class=\"fa fa-thumbs-o-up #{config.class}\" data-id=\"#{config.dataId}\"></i>"
