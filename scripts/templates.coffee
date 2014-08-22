namespace("WidgetTemplate")

class WidgetTemplate.Templates
  @renderForm: () ->
    _.template("""
                  <div class="widget" data-id="template-widget-wrapper">
                    <div class="widget-header">
                      <h2 class="widget-title">Weather</h2>
                      <span class='widget-close' data-id='template-close'>×</span>
                      <div class="widget-form" data-id="template-form">
                        <input name="weather-search" type="text" autofocus="true">
                        <button data-id="template-button">Get current weather</button><br>
                      </div>
                    </div>
                    <div class="widget-body" data-id="template-output"></div>
                  </div>
                """)
