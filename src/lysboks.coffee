#
# Lysboks - js based cms
#

# require needed modules
options = require 'commander'
server    = require './server/server'

# Options parsers
parseModeOption = (val) ->
	if val not in ['dev','prod']
		val = 'dev'
	return val

# Define options
options
	.version('0.0.1')
  .option('-m --mode [type]', 'Mode in which lysboks is executed [dev, prod] defaults to dev', parseModeOption, 'dev')

console.log 'Beginning to run lysboks in ' + options.mode + 'mode . . .'



server.start options