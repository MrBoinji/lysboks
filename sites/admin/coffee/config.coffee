require.config
	paths:
		angular: "../bower_components/angular/angular"
		bootstrap: "../bower_components/bootstrap/dist/js/bootstrap"
		jquery: "../bower_components/jquery/dist/jquery"
		requirejs: "../bower_components/requirejs/require"
		ngResource: "../bower_components/angular-resource/angular-resource"

	packages: [

	]

	shim:
		angular:
			exports: 'angular'

		ngResource: {
			deps: ['angular']
			exports: 'angular'
		}

