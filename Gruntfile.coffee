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

		copy:
			default:
				cwd: 'src'
				src: ['libs/*.js']
				dest: 'build'
				expand: true


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
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	# Default task.
	grunt.registerTask 'fastbuild' , ['coffee', 'copy']
	grunt.registerTask 'build'     , ['clean','coffee', 'copy']
	grunt.registerTask 'default'   , ['build']
	grunt.registerTask 'lysboks'   , 'Run the lysboks server', () ->
		require './build/lysboks.js'

