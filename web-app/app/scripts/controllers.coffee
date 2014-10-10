'use strict'

### Controllers ###

angular.module('app.controllers', [
  'app.services'
])

.controller('AppCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'soundcloud'

($scope, $location, $resource, $rootScope, soundcloud) ->
  $scope.Math = window.Math

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  soundcloud.initialize ->
    soundcloud.getProfile()

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])

.controller('MyCtrl1', [
  '$scope'

($scope) ->
  $scope.onePlusOne = 2
  $scope.toggle = false
  $scope.doThing = ->
    $scope.toggle = !$scope.toggle
])

.controller('PlaylistCtrl', [
  '$scope'
  '$rootScope'
  '$routeParams'
  'soundcloud'

($scope, $rootScope, $routeParams, soundcloud) ->
  soundcloud.getPlaylist $routeParams.playlistId, (pls) ->
    $rootScope.$apply ->
      $rootScope.activeTrackList = pls.tracks
    $scope.$apply ->
      $scope.playlist = pls

  $scope.playFromIndex = (ind) ->
    soundcloud.playFromIndex(ind)
])

.controller('FavoritesCtrl', [
  '$scope'
  'soundcloud'

($scope, soundcloud) ->
  soundcloud.getFavorites()

  $scope.playFromIndex = (ind) ->
    soundcloud.playFromIndex(ind)
])

.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    $scope.todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo) ->
      $scope.todos.push todo  unless todo.done

])

