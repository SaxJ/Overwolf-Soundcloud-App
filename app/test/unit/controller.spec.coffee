describe 'AppController', ->
  beforeEach module 'SoundCloudPlayer'

  it 'Should create model with 3 items', inject ($controller) ->
    scope = {}
    ctrl = $controller 'AppController', {$scope:scope}

    expect(scope.items.length).toBe(3)