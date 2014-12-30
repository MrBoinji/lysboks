
app = angular.module 'lysboksAdmin', []


#Header code
app.directive 'lsHeader', () ->
	return {
		restrict: 'E'
		templateUrl: 'app/header.tpl.html'
		controller: () ->
			@testVar = '03:17'

		controllerAs: 'header'
	}