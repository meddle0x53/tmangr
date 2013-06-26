TaskManagement.TasksNewController = Em.ObjectController.extend
  startEditing: () ->
    @transaction = @get('store').transaction()
    @set('model', @transaction.createRecord(TaskManagement.Task, {}))
    @set('users', TaskManagement.User.find())
    @set('states', ['opened', 'closed'])

  stopEditing: () ->
    if @transaction
      @transaction.rollback()
      @transaction = null

  save: () ->
    @transaction.commit()
    @transaction = null

