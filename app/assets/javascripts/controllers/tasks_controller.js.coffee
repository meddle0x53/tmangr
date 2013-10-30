TaskManagement.TasksController = Ember.ArrayController.extend(
  sortProperties: ['description']
  isPublic: true

  actions:
    sort: (prop) ->
      @set('sortProperties', [prop])

)

