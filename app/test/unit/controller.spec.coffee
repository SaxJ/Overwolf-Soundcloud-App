describe 'Sound cloud player controllers', ->

  describe 'Main app controller', ->
    scope = null
    ctrl = null
    $httpBackend = null


    beforeEach(module 'SoundCloudPlayer')

    beforeEach inject (_$httpBackend_, $rootScope, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.expectGET('phones/phones.json').respond [{name: 'Nexus S'}, {name: 'Motorola DROID'}]
      scope = $rootScope.$new()
      ctrl = $controller('AppController', {$scope: scope})

    it 'should create model with 2 items fetched from xhr', ->
      expect(scope.phones).toBeUndefined()
      $httpBackend.flush()

      expect(scope.phones).toEqual([{name: 'Nexus S'},{name: 'Motorola DROID'}])

    it 'should set the default value of orderProp model', ->
      expect(scope.orderProp).toBe('age');