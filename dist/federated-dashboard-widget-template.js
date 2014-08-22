(function(underscore) {
  'use strict';

  window.namespace = function(string, obj) {
    var current = window,
        names = string.split('.'),
        name;

    while((name = names.shift())) {
      current[name] = current[name] || {};
      current = current[name];
    }

    underscore.extend(current, obj);

  };

}(window._));

(function() {
  namespace('WidgetTemplate');

  WidgetTemplate.Controller = (function() {
    function Controller() {}

    Controller.setupWidgetIn = function(settings) {
      var templateHtml;
      templateHtml = WidgetTemplate.Templates.renderForm();
      return $(settings.container).html(templateHtml);
    };

    Controller.exitEditMode = function() {
      $('[data-id=template-form]').hide();
      return $('.widget-close').hide();
    };

    Controller.enterEditMode = function() {
      $('[data-id=template-form]').show();
      return $('.widget-close').show();
    };

    return Controller;

  })();

}).call(this);

(function() {
  namespace('Template');

  Template.Display = (function() {
    function Display() {}

    Display.generateLogo = function(config) {
      return "<i class=\"fa fa-thumbs-o-up " + config["class"] + "\" data-id=\"" + config.dataId + "\"></i>";
    };

    return Display;

  })();

}).call(this);

(function() {
  namespace("WidgetTemplate");

  WidgetTemplate.Templates = (function() {
    function Templates() {}

    Templates.renderForm = function() {
      return _.template("<div class=\"widget\" data-id=\"template-widget-wrapper\">\n  <div class=\"widget-header\">\n    <h2 class=\"widget-title\">Weather</h2>\n    <span class='widget-close' data-id='template-close'>×</span>\n    <div class=\"widget-form\" data-id=\"template-form\">\n      <input name=\"weather-search\" type=\"text\" autofocus=\"true\">\n      <button data-id=\"template-button\">Get current weather</button><br>\n    </div>\n  </div>\n  <div class=\"widget-body\" data-id=\"template-output\"></div>\n</div>");
    };

    return Templates;

  })();

}).call(this);
