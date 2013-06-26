TaskManagement.TasksController = Ember.ArrayController.extend(
  sortProperties: ['description']
  isPublic: true

  destroyTask: (task) ->
    task.deleteRecord()
    task.get('store').commit()

  sort: (prop) ->
    @set('sortProperties', [prop])

)

