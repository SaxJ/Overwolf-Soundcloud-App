describe 'SoundCloudApp', ->
  describe 'Item list view', ->
    beforeEach ->
      browser.get 'index.html'

    it 'Should filter list as user types into box', ->
      lst = element.all(by.repeater 'i in items')
      query = element(by.model 'query')

      expect(lst.count()).toBe 3
      query.sendKeys 'nexus'
      expect(lst.count()).toBe 1

      query.clear()

      query.sendKeys 'motorola'
      expect(lst.count()).toBe 2