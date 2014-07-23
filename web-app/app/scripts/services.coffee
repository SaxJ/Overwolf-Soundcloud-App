'use strict'

### Sevices ###

angular.module('app.services', [])

.factory 'soundcloud', ->
  soundcloud = {}

  soundcloud.getMe = (callback) ->
    SC.get '/me', callback

  soundcloud.getPlaylists = (callback) ->
    SC.get '/me/playlists', callback

  return soundcloud

.factory 'version', -> "0.1"
