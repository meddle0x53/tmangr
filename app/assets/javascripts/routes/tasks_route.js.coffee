TaskManagement.TasksRoute = Ember.Route.extend
  model: () ->
    if @get('currentUser')
      model = TaskManagement.Task.find()

