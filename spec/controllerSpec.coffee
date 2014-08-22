describe "WidgetTemplate.Controller", ->
  describe "setupWidgetIn", ->
    it "sets up a widget template in the given container", ->
      setFixtures sandbox()
      WidgetTemplate.Controller.setupWidgetIn({container: '#sandbox'})
      expect($('#sandbox')).toContainElement('.widget')
      expect($('#sandbox')).toContainElement('.widget-header')
      expect($('#sandbox')).toContainElement('.widget-title')
      expect($('#sandbox')).toContainElement('.widget-close')
      expect($('#sandbox')).toContainElement('.widget-form')
      expect($('.widget-form')).toContainElement('input')
      expect($('.widget-form')).toContainElement('button')

  describe "hideForms", ->
    it "hides the forms and the closing button", ->
      setFixtures sandbox()
      WidgetTemplate.Controller.setupWidgetIn({container: '#sandbox'})
      WidgetTemplate.Controller.hideForms()
      expect($('.widget-form').attr('style')).toEqual('display: none;')
      expect($('.widget-close').attr('style')).toEqual('display: none;')

  describe "showForms", ->
    it "shows the forms and the closing button", ->
      setFixtures sandbox()
      WidgetTemplate.Controller.setupWidgetIn({container: '#sandbox'})
      WidgetTemplate.Controller.hideForms()
      expect($('.widget-form').attr('style')).toEqual('display: none;')
      expect($('.widget-close').attr('style')).toEqual('display: none;')
      WidgetTemplate.Controller.showForms()
      expect($('.widget-form').attr('style')).not.toEqual('display: none;')
      expect($('.widget-close').attr('style')).not.toEqual('display: none;')
