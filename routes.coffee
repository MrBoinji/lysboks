url             = require 'url'
SitesController = require './core/controllers/sites_controller'
AdminController = require './core/controllers/admin/admin_controller'
express         = require 'express'

adminController = new AdminController()

module.exports = (LB) ->

	LB.get '/data', (req, res) ->
		console.log "GET MODEL"

	LB.post '/data', (req, res) ->
		console.log "POST MODEL"

	LB.put '/data', (req, res) ->
		console.log "PUT MODEL"

	LB.delete '/data', (req, res) ->
		console.log "DELETE MODEL"

	LB.use '/admin', express.static __dirname + '/sites/admin'


#	LB.use '/sites/:siteName', sites.getContent

#	LB.use sites.getContent