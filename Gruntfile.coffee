module.exports = (grunt) ->

	#Project configuration
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		clean:
			default: ['./build/*']


		coffee:
			default:
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

			default:
				src: 'build/<%= pkg.name %>.js'
				dest: 'build/<%= pkg.name %>.min.js'

		watch:
			coffee:
				files: ['**/*.coffee']
				tasks: ['coffee:build']

	# These plugins provide necessary tasks.
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-clean'

	# Default task.
	grunt.registerTask 'fastbuild' , ['coffee']
	grunt.registerTask 'build'     , ['clean','coffee']
	grunt.registerTask 'default'   , ['build', 'lysboks']
	grunt.registerTask 'lysboks'   , 'Run the lysboks server', () ->
		require './build/lysboks.js'

