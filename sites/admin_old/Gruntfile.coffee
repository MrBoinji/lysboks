module.exports = (grunt) ->

	#Project configuration
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
			'<%= grunt.template.today("yyyy-mm-dd") %>\n' +
			'<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
			'* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
			' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n'

		bower:
			target:
				rjsConfig: 'js/config.js'

		clean:
			default: ['./dist/*', './js/*']

		coffee:
			default:
				expand: true
				cwd: 'coffee'
				src: ['**/*.coffee']
				dest: 'js'
				ext: '.js'

		concat:
			options:
				banner      : '<%= banner %>'
				stripBanners: true

			dist:
				src : ['bower_components/requirejs/require.js', 'js/admin.js' ]
				dest: 'dist/js/admin.js'


		copy:
			default:
				cwd: ''
				src: ['']
				dest: 'dist'
				expand: true

		requirejs:
			compile:
				options:
					name          : 'config'
					mainConfigFile: 'js/config.js'
					out           : 'dist/js/admin.js'
					optimize      : 'none'
					findNestedDependencies: true

		watch:
			coffee:
				files: ['**/*.coffee']
				tasks: ['jsBuild']

	grunt.loadNpmTasks 'grunt-bower-requirejs'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-concat'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-requirejs'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'jsBuild' , ['coffee', 'bower', 'requirejs', 'concat']

