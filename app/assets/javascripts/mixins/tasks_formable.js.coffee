TaskManagement.TasksFormable = Ember.Mixin.create
  renderTemplate: ->
    @render 'tasks/form', ->
      outlet: 'modal'
  events:
    cancel: (task) ->
      task.transaction.rollback()
      @transitionTo 'tasks'
    submit: (controller) ->
      controller.save()
      @transitionTo 'tasks'
