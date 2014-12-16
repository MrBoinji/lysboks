
_    = require 'underscore'
fs   = require 'fs'
path = require 'path'


class HTMLController

	buildPage: (conf) ->
		fs.readFile path.join(__dirname, '../templates/base.html'), encoding: 'utf-8', (err, data) ->
			if (err)
				throw err

			_baseTemplate = _.template data.toString()

module.export = HTMLController