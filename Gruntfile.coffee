config =
	debugAppPort: 5555
	port: 7777

module.exports = (grunt) ->

	#Project configuration
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		clean:
			default: ['./build/*']

		coffee:
			default:
				expand: true
				cwd: ''
				src: ['**/*.coffee']
				dest: 'build'
				ext: '.js'

		concurrent:
			dev:
				tasks: ['nodemon']
				options:
					logConcurrentOutput: true

		copy:
			default:
				cwd: ''
				src: ['**/*.json', '**/*.html']
				dest: 'build'
				expand: true

		nodemon:
			debug:
				script: 'lysboks.coffee'
				options:
					env:
						port: config.port
					ignore: [
						'**/node_modules/**'
						'**/bower_components/**'
					]

		'node-inspector':
			custom:
				options:
					'web-port': config.debugAppPort
					'web-host': 'localhost'
					'debug-port': config.port

		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'

			default:
				src: 'build/<%= pkg.name %>.js'
				dest: 'build/<%= pkg.name %>.min.js'

#		watch:
#			devChanges:
#				files: ['**/*.coffee']
#				tasks: ['concurrent:dev']

	# These plugins provide necessary tasks.
	grunt.loadNpmTasks 'grunt-concurrent'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'
#	grunt.loadNpmTasks 'grunt-forever'
	grunt.loadNpmTasks 'grunt-node-inspector'
	grunt.loadNpmTasks 'grunt-nodemon'
	grunt.loadNpmTasks 'grunt-services'

	# Default task.
	grunt.registerTask 'fastBuild' , ['coffee', 'copy']
	grunt.registerTask 'build'     , ['clean', 'coffee', 'copy']
	grunt.registerTask 'default'   , ['build']
	grunt.registerTask 'startDev'  , () ->
		grunt.task.run ['startMongo', 'concurrent:dev']

#	grunt.registerTask 'stopDev'   , ['forever:lysboks:stop', 'stopMongo']
#	grunt.registerTask 'updateDev' , ['fastBuild', 'forever:lysboks:stop', 'forever:lysboks:start']


