'use strict'

### Sevices ###

angular.module('app.services', [])

.factory('soundcloud', [
  '$rootScope'

($rootScope) ->
  soundcloud = {}

  ###
  #Initializes the soundcloud client, uses the old access token, or logging in
  #if needed.
  ###
  soundcloud.initialize = (callback)->
    $rootScope.activeTrackList = $rootScope.activeTrackList or []
    $rootScope.activeTrack = $rootScope.activeTrack or null
    $rootScope.soundcloud_auth = false
    if localStorage.getItem 'auth_token'
      $rootScope.soundcloud_auth = true
      SC.initialize
        client_id: "8e78602bbc355a3d2b21f9af620ffe74"
        redirect_uri: "http://localhost:3333/callback.html"
        access_token: localStorage.getItem 'auth_token'
      if callback
        callback()
    else
      SC.connect ->
        $rootScope.$apply ->
          $rootScope.soundcloud_auth = true
        localStorage.setItem 'auth_token', SC.accessToken()

        if callback
          callback()

  soundcloud.getProfile = (callback) ->
    SC.get '/me', (me) ->
      $rootScope.$apply ->
        $rootScope.me = me

      SC.get '/me/playlists', (pls) ->
        $rootScope.$apply ->
          $rootScope.me.playlists = pls
        if callback
          callback()

  soundcloud.getFavorites = ->
    SC.get '/me/favorites', (lst) ->
      if not lst.errors
        $rootScope.$apply ->
          $rootScope.activeTrackList = lst
      else
        throw new Error('AN error occurred in fetching favourites.')

  soundcloud.getPlaylist = (id, callback) ->
    SC.get "/playlists/#{id}", callback

  soundcloud.playFromIndex = (index) ->
    console.log 'Play from index: ', index
    if $rootScope.activeTrack?
      $rootScope.activeTrack.pause()
      $rootScope.activeTrack.unload()
    SC.stream "/tracks/#{$rootScope.activeTrackList[index].id}", (sound) ->
      $rootScope.activeTrack = sound
      sound.play()
    return

  return soundcloud
])

.factory 'version', -> "0.1"
