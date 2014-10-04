describe 'WidgetTemplate.Widgets.Display', ->
  newDisplay = (container) ->
    new WidgetTemplate.Widgets.Display({container: container})

  setupDisplay = ->
    setFixtures sandbox()
    display = newDisplay('#sandbox')
    display.initialize()
    display

  it 'initialize displays the form in the given container', ->
    setupDisplay()
    expect($('#sandbox')).toContainElement('.widget')
    expect($('#sandbox')).toContainElement('.widget-header')
    expect($('#sandbox')).toContainElement('.widget-title')
    expect($('#sandbox')).toContainElement('.widget-close')
    expect($('#sandbox')).toContainElement('.widget-form')
    expect($('.widget-form')).toContainElement('input')
    expect($('.widget-form')).toContainElement('button')

  it 'getInput is returning text in the input field', ->
    setupDisplay()
    $('.widget-form input').val('test@test.com')

#Write your own test from here on...
  it 'showText is displaying the text', ->
    display = setupDisplay()
    text = 'Write your own tests from here'
    display.showText(text)
    expect($('[data-name=widget-output]')).toContainText(text)
