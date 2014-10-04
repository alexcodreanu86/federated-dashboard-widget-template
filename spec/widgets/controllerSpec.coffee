describe 'WidgetTemplate.Widgets.Controller', ->
  newController = (container, defaultValue) ->
    new WidgetTemplate.Widgets.Controller({ container: container, defaultValue: defaultValue })

  setupController = ->
    setFixtures sandbox()
    controller = newController('#sandbox')
    controller.initialize()
    controller

  describe '#initialize', ->
    it 'executes widget setup', ->
      setupController()
      expect($('.widget-form')).toContainElement('button')

    it 'binds the form submission widget input processing', ->
      setupController()
      $('[name=widget-input]').val("test")
      $('[data-name=widget-form]').submit()
      expect($('[data-name=widget-output]')).not.toBeEmpty()

    it 'binds the click close button to the closeWidget method', ->
      setupController()
      expect($('#sandbox')).toBeInDOM()
      $('[data-name=widget-close]').click()

      expect($('#sandbox')).not.toBeInDOM()

  describe '#closeWidget', ->
    it 'is unbinding itself', ->
      controller = newController('#sandbox')
      spyOn(controller, 'unbind')
      controller.closeWidget()

      expect(controller.unbind).toHaveBeenCalled()

  describe '#unbind', ->
    it 'unbinds the form submission', ->
      controller = setupController()
      spy = spyOn($.prototype, 'unbind')

      controller.unbind()
      expect(spy).toHaveBeenCalledWith('submit')

    it 'unbinds the close-widget button', ->
      controller = setupController()
      controller.unbind()

      $('[data-name=widget-close]').click()
      expect('#sandbox').toBeInDOM()

# From here on it's all you, remember red green refactor (TDD)
