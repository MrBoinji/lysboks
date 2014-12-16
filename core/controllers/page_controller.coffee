# Modules
_    = require 'underscore'
fs   = require 'fs'
path = require 'path'

# Templates
_baseTemplate = undefined;

fs.readFile path.join(__dirname, '../templates/base.html'), encoding: 'utf-8', (err, data) ->
	if (err)
		throw err

		_baseTemplate = _.template data.toString()

controller = exports

controller.deliverPage = (req, res) ->
	console.log();
	path = req.path
	res.send "HALLO!!!0099"

controller.getPageContent = (req) ->
	#Add caching and stuff
	pageContent = controller.buildPageContent(req);


controller.buildPageContent = (req) ->
	

#	pageIdentifier = path.split('/')[0]
#
#	urlParts = url.split '/'
#
#	if _baseTemplate
#		return _baseTemplate({
#			headContent: '',
#			bodyContent: '<h1>I AM THE NEW BODY CONTENT</h1>'
#		});



#getBaseTemplate = () ->
#	return