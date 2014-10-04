describe "WidgetTemplate.Display", ->
  it "generateLogo returns the weather image tag", ->
    imageHtml = WidgetTemplate.Display.generateLogo({dataId: "template-logo", class: "some-class"})
    expect(imageHtml).toBeMatchedBy('[data-id=template-logo]')
    expect(imageHtml).toBeMatchedBy('.some-class')
