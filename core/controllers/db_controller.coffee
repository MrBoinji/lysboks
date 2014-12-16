#Currently this db controller is used to communicate with mongo dbs.
#Later it should be abstracted to support various databases

dbConnection = null

getDBConnection = (host, port) ->
	unless dbConnection
		dbConnection = mongoose.createConnection host, port, (err) ->
			console.error 'ERROR connecting to DB', err if err
	return dbConnection

retrieveConnection = (host, port, callback) ->
#	if (!dbConnection or dbConnection != 1){
#
#	}



DBController = (host, port, name) ->
	@db = mongoose.createConnection host, port, (err) ->
		console.error 'MongoDB connection failed.', err if err


module.exports = DBController


db = mongoose.createConnection host, port, (err) ->
	console.error 'ERROR connecting to DB', err if err
db.get = (name, tenant) ->
	model = models[name]
	schema = null
	if tenant
		try
			schema = db.model tenant+'.'+name
		catch error
			schema = db.model tenant+'.'+name, model.schema, tenant+'.'+model.collection if not schema
	else
		try
			schema = db.model name
		catch error
			schema = db.model name, model.schema if not schema
	return schema