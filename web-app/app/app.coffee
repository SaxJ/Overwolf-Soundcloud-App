'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/favorites', {templateUrl: '/partials/favorites.html', controller: 'FavoritesCtrl'})
    .when '/playlist/:playlistId',
      templateUrl: '/partials/playlist.html'
      controller: 'PlaylistCtrl'

    # Catch all
    .otherwise({redirectTo: '/favorites'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
