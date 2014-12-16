
class AbstractResponder
	constructor: (@opts) ->

	respond: (req, res) ->
		res.send 'ABSTRACT RESPONDER'



module.exports = AbstractResponder