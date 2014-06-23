module.exports = (grunt) ->

	#Project configuration
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		coffee:
			build:
				expand: true
				cwd: 'src'
				src: ['**/*.coffee']
				dest: 'build'
				ext: '.js'

#		copy:
#			build:
#				cwd: 'src'
#				src: ['**']
#				dest: 'build'
#				expand: true

		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'

			build:
				src: 'lib/<%= pkg.name %>.js'
				dest: 'lib/<%= pkg.name %>.min.js'

		watch:
			coffee:
				files: ['**/*.coffee']
				tasks: ['coffee:build']

	# These plugins provide necessary tasks.
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	# Default task.
	grunt.registerTask 'build', ['coffee']
	grunt.registerTask 'default', ['build']
