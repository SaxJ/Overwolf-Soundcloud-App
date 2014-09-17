'use strict'

### Sevices ###

angular.module('app.services', [])

.factory('soundcloud', [
  '$rootScope'

($rootScope) ->
  soundcloud = {}
  $rootScope.activeTrackList = []

  soundcloud.login = (callback) ->
    SC.connect ->
      $rootScope.$apply ->
        $rootScope.authenticated = true
        if callback?
          callback()
      SC.get '/me', (me) ->
        $rootScope.$apply ->
          $rootScope.me = me

        SC.get '/me/playlists', (pls) ->
          $rootScope.$apply ->
            $rootScope.me.playlists = pls

  soundcloud.getMe = (callback) ->
    SC.get '/me', callback

  soundcloud.getFavorites = ->
    SC.get '/me/favorites', (lst) ->
      if not lst.errors
        $rootScope.$apply ->
          $rootScope.activeTrackList = lst
      else
        soundcloud.login ->
          soundcloud.getFavorites()

  soundcloud.getPlaylists = (id, callback) ->
    SC.get "/users/#{id}/playlists", callback

  soundcloud.playFromIndex(index) {
    
  }

  return soundcloud
])

.factory 'version', -> "0.1"
