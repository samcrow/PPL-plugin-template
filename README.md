# Plugin interface example #

This is a simple example plugin that uses the plugin-interface code.

## To use ##

Clone the project recursively to include the plugin-interface code

	$ git clone --recursive https://github.com/samcrow/plugin-interface-example.git YourPluginName
	$ cd YourPluginName

Use the included script to set up the code with your plugin name, signature and description

	$ ./bootstrap.rb YourPluginName 'Your Plugin Name' 'your.plugin.signature' 'A description of your plugin'
