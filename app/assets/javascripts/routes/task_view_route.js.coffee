TaskManagement.TaskViewRoute = Ember.Route.extend
  renderTemplate: ->
    @render 'task_view', ->
      outlet: 'modal'
  events:
    cancel: () ->
      @transitionTo 'tasks'
    ok: () ->
      @transitionTo 'tasks'

  model: (params) ->
    TaskManagement.Task.find(params.task_id)

