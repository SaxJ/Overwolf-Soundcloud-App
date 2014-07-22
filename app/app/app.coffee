'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('SoundCloudPlayer', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'SoundCloudPlayer.controllers'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when '/phones',
      templateUrl: '/partials/list.html'
      controller: 'ListController'
    .when '/phones/:phoneId',
      templateUrl: '/partials/detail.html'
      controller: 'DetailController'

    # Catch all
    .otherwise({redirectTo: '/phones'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
