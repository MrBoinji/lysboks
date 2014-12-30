module.exports = (grunt) ->

	#Project configuration
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
			'<%= grunt.template.today("yyyy-mm-dd") %>\n' +
			'<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
			'* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
			' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n'

		clean:
			dist: ['dist/*']
			tmp: ['.tmp/*']

		coffee:
			default:
				expand: true
				cwd: 'app'
				src: ['**/*.coffee']
				dest: '.tmp/app'
				ext: '.js'

		concat:
			options:
				banner      : '<%= banner %>'
				stripBanners: true

			dist:
				src : [
					'bower_components/angular/angular.js'
					'bower_components/jquery/jquery.js'
					'.tmp/app/**/*.js'
				]
				dest: 'dist/admin.js'

		copy:
			default:
				cwd: ''
				src: ['']
				dest: 'dist'
				expand: true

		html2js:
			admin:
				src: ['app/**/*.tpl.html'],
				dest: '.tmp/app/templates.js'

		ngAnnotate:
			admin:
				files: [
					expand: true
					cwd: "./.tmp/app"
					src: ['**/*.js']
					dest: './.tmp/app'
					extDot: 'last'
				]

		watch:
			coffee:
				files: ['**/*.coffee']
				tasks: ['dev']

	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-concat'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-html2js'
	grunt.loadNpmTasks 'grunt-ng-annotate'


	grunt.registerTask 'dev' , ['clean', 'coffee', 'ngAnnotate', 'html2js', 'concat', 'clean:tmp']

