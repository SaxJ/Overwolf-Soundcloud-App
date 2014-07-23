'use strict'

### Sevices ###

angular.module('app.services', [])

.factory('soundcloud', [
  '$rootScope'

($rootScope) ->
  soundcloud = {}

  soundcloud.login = ->
    SC.connect ->
      $rootScope.$apply ->
        $rootScope.authenticated = true
      SC.get '/me', (me) ->
        $rootScope.$apply ->
          $rootScope.me = me

  soundcloud.getMe = (callback) ->
    SC.get '/me', callback

  soundcloud.getPlaylists = (callback) ->
    SC.get '/me/playlists', callback

  return soundcloud
])

.factory 'version', -> "0.1"
