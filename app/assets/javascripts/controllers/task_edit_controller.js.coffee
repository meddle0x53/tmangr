TaskManagement.TaskEditController = Em.ObjectController.extend
  needs: ['task'],

  startEditing: () ->
    @set('users', TaskManagement.User.find())
    @set('states', ['opened', 'closed'])

    task = @get('model')
    transaction = task.get('store').transaction()
    transaction.add(task)
    @transaction = transaction

  stopEditing: () ->
    transaction = @transaction
    if transaction
      transaction.rollback()
      @transaction = undefined

  save: () ->
    @transaction.commit()
    @transaction = null
