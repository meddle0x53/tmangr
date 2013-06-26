TaskManagement.TaskEditRoute = Ember.Route.extend TaskManagement.TasksFormable,
  model: (params) ->
    TaskManagement.Task.find(params.task_id)

  setupController: (controller, model) ->
    @_super.apply(this, arguments)

    if @get('currentUser')
      @controllerFor('task.edit', model).set('content', model)
      @controllerFor('task.edit', model).startEditing()

  deactivate: () ->
    @controllerFor('task.edit').stopEditing()
