namespace('Template')

class Template.Display
  @generateLogo: (config) ->
    "<i class=\"fa fa-thumbs-o-up #{config.class}\" data-id=\"#{config.dataId}\"></i>"
