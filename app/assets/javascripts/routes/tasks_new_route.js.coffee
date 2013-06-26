TaskManagement.TasksNewRoute = Ember.Route.extend TaskManagement.TasksFormable,
  model: () ->
    return null

  setupController: (controller) ->
    @_super.apply(this, arguments)
    if @get('currentUser')
      controller.startEditing()

  deactivate: () ->
    @controllerFor('tasks.new').stopEditing()

