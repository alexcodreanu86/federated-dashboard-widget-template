#Federated Dashboard Widget Template

This is a basic widget template for the [Federated Dashboard](https://github.com/alexcodreanu86/federated-dashboard).

### How to use the template

The instructions assume that you have npm and node installed. (Directions on installing Node can be found [here](http://nodejs.org/))

1. After cloning this repo, inside the cloned directory run `npm install` to install all the node dependencies and `bower install` to install all the bower components.

2. In the project directory execute `testem` to run the specs

3. The template has the namespace of `WidgetTemplate`. Change this name to the name of your widget in all the script and spec files.

4. If you intend to use the widget with the [Federated Dashboard](https://github.com/alexcodreanu86/federated-dashboard) make sure to keep the basic functionality that is already implemented (except the methods that suggest otherwise)


The template is fully functioning (when testem is running go [here](http://localhost:7357/index.html) to view the template in action, this is setup in `index.html` which will have to change when you change the namespace)

### Testem Settings
For testing this template uses [testem](https://github.com/airportyh/testem) with jasmine2 as the testing framework.

Testem can be customized to your needs in the `testem.json` file.
In this repo it is setup to use all the files inside `.tmp/scripts/**/*.js` and `.tmp/spec/**/*.js`.

### Grunt Settings
The contents of the `scripts/` and the `spec` directory are being compiled and saved in th `.tmp` directory.

The concatenated and the minified files of the project are being saved in the `dist/` directory.

All these can be changed by changing the `Gruntfile.js`. For documentation on grunt go [here](http://gruntjs.com/).

I think that is it.
Have fun with it and remember **red green refactor**...

