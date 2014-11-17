# Plugin Template #

A template for X-Plane plugins, using [plugin-interface](https://github.com/samcrow/plugin-interface), with a script for automatic project configuration

## To use ##

Clone the project recursively to include the plugin-interface code

	$ git clone --recursive https://github.com/samcrow/plugin-template.git YourPluginName
	$ cd YourPluginName

Use the included script to set up the code with your plugin name, signature and description

	$ ./bootstrap.rb YourPluginName 'Your Plugin Name' 'your.plugin.signature' 'A description of your plugin'


## Licensing ##

The licensing for this project is intended to provide ultimate freedom from restrictions on the files that remain after `bootstrap.rb` is executed.

`bootstrap.rb` is licensed under the Boost software license.

The plugin-interface code (in a submodule) is licensed under the Boost software license.

The project file and the plugin source and header files are in the public domain.
