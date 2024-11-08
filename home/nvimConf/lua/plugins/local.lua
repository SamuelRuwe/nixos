local local_plugins = {
	{
		"sams_plugin",
		dir = "~/projects/local_plugin",
		config = function()
			print("Hello world")
			require("sams_plugin")
		end,
	},
}

return local_plugins
