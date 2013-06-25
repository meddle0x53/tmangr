TaskManagement.TasksController = Ember.ArrayController.extend(
  sortProperties: ['description']
  isPublic: true

  sort: (prop) ->
    @set('sortProperties', [prop])

)

