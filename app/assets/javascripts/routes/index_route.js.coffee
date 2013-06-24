TaskManagement.IndexRoute = Ember.Route.extend
  redirect: () ->
    @transitionTo('tasks')

