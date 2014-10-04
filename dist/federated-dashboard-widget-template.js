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
      return new WidgetTemplate.Widgets.Controller(settings).initialize();
    };

    return Controller;

  })();

}).call(this);

(function() {
  namespace('WidgetTemplate');

  WidgetTemplate.Display = (function() {
    function Display() {}

    Display.generateLogo = function(config) {
      return "<i class=\"fa fa-thumbs-o-up " + config["class"] + "\" data-id=\"" + config.dataId + "\"></i>";
    };

    return Display;

  })();

}).call(this);

(function() {
  namespace('WidgetTemplate.Widgets');

  WidgetTemplate.Widgets.Controller = (function() {
    function Controller(settings) {
      this.settings = settings;
      this.container = this.settings.container;
      this.display = new WidgetTemplate.Widgets.Display(this.settings);
    }

    Controller.prototype.initialize = function() {
      this.display.initialize();
      return this.bind();
    };

    Controller.prototype.bind = function() {
      $("" + this.container + " [data-name=widget-close]").on('click', (function(_this) {
        return function() {
          return _this.closeWidget();
        };
      })(this));
      return $("" + this.container + " [data-name=widget-form]").on('submit', (function(_this) {
        return function(event) {
          event.preventDefault();
          return _this.processFormSubmission();
        };
      })(this));
    };

    Controller.prototype.closeWidget = function() {
      this.unbind();
      return this.display.removeWidget();
    };

    Controller.prototype.unbind = function() {
      $("" + this.container + " [data-name=widget-form]").unbind('submit');
      return $("" + this.container + " [data-name=widget-close]").unbind('click');
    };

    Controller.prototype.processFormSubmission = function() {
      var input;
      input = this.display.getInput();
      return this.display.showText(input);
    };

    return Controller;

  })();

}).call(this);

(function() {
  namespace('WidgetTemplate.Widgets');

  WidgetTemplate.Widgets.Display = (function() {
    function Display(settings) {
      this.settings = settings;
      this.container = this.settings.container;
    }

    Display.prototype.initialize = function() {
      return this.setupForm();
    };

    Display.prototype.setupForm = function() {
      return $(this.container).html(WidgetTemplate.Widgets.Templates.renderForm());
    };

    Display.prototype.getInput = function() {
      return $("" + this.container + " [name=widget-input]").val();
    };

    Display.prototype.showText = function(text) {
      var formatedText;
      formatedText = WidgetTemplate.Widgets.Templates.wrapText(text);
      return $("" + this.container + " [data-name=widget-output]").append(formatedText);
    };

    Display.prototype.removeWidget = function() {
      return $(this.container).remove();
    };

    return Display;

  })();

}).call(this);

(function() {
  namespace("WidgetTemplate.Widgets");

  WidgetTemplate.Widgets.Templates = (function() {
    function Templates() {}

    Templates.renderForm = function() {
      return _.template("<div class='widget' data-name='widget-wrapper'>\n  <div class='widget-header' data-name='sortable-handle'>\n    <h2 class=\"widget-title\">Notifications</h2>\n    <span class='widget-close' data-name='widget-close'>×</span>\n    <form class='widget-form' data-name='widget-form'>\n      <input name='widget-input' type='text' autofocus='true'>\n      <button data-name=\"form-button\">Load Notifications</button><br>\n    </form>\n  </div>\n  <div class=\"widget-body\" data-name=\"widget-output\"></div>\n</div>", {});
    };

    Templates.wrapText = function(text) {
      return _.template("<p><%= message %></p>", {
        message: text
      });
    };

    return Templates;

  })();

}).call(this);
