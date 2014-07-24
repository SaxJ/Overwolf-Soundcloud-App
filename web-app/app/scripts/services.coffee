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

        SC.get '/me/playlists', (pls) ->
          $rootScope.$apply ->
            $rootScope.me.playlists = pls

  soundcloud.getMe = (callback) ->
    SC.get '/me', callback

  soundcloud.getPlaylists = (id, callback) ->
    SC.get "/users/#{id}/playlists", callback

  return soundcloud
])

.factory 'version', -> "0.1"
