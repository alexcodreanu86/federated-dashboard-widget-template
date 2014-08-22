describe "WidgetTemplate.Controller", ->
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
