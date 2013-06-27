TaskManagement.TasksRoute = Ember.Route.extend
  model: () ->
    if @get('currentUser')
      model = TaskManagement.Task.find()

  activate: () ->
    @get("sock").subscribe("main")

  events:
    'task.create': (data) ->
      id = parseInt(@get('currentUser').get('id'), 10)
      if (data.performer_id != id) && (data.owner_id != id)
        return

      task = TaskManagement.Task.find(data.id)
    'task.destroy': (data) ->
      task = TaskManagement.Task.find(data.id)
      if task.get('isLoaded')
        task.deleteRecord()

      task.on "didLoad", ->
        task.deleteRecord()
    'task.update': (data) ->
      task = TaskManagement.Task.find(data.id)
      if task.get('isLoaded')
        @updateTask(task, data)

  updateTask: (task, data) ->
    id = parseInt(@get('currentUser').get('id'), 10)

    if (data.performer_id != id) && (data.owner_id != id)
      task.deleteRecord()
      return
    if task.get('isDirty')
      task.rollback()

    task.set('description', data.description)
    task.set('performer_id', data.performer_id)
    task.set('state', data.state)

