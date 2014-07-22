SoundCloudPlayerControllers = angular.module 'SoundCloudPlayer.controllers', []

SoundCloudPlayerControllers.controller 'ListController', [
  '$scope'
  '$http'

($scope, $http) ->
  $http.get('phones/phones.json').success (data) ->
    console.log data
    $scope.phones = data

  $scope.orderProp = 'age'
]

SoundCloudPlayerControllers.controller 'DetailController', [
  '$scope'
  '$routeParams'

  ($scope, $routeParams) ->
    $scope.phoneId = $routeParams.phoneId
]