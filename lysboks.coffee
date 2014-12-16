#
# Lysboks - js based cms
#

# require external node modules
cmdLineOptions = require 'commander'
express        = require 'express'

constants =
	filePaths:
		config: __dirname + '/config.json'

config = require constants.filePaths.config


# Options parsers
parseModeOption = (val) ->
	if val not in ['dev','prod']
		val = 'dev'
	return val

# Define options
cmdLineOptions
	.version('0.0.1')
  .option('-m --mode [type]', 'Mode in which lysboks is executed [dev, prod] defaults to dev', parseModeOption, 'dev')

console.log 'Beginning to run lysboks in ' + cmdLineOptions.mode + ' mode . . .'

# Creating application
LB = express()

# setup routing
routes = require('./routes') LB

server = LB.listen config.port, () ->
	console.log 'Lysboks was started on %s and is listening on port %d', server.address().address ,server.address().port

