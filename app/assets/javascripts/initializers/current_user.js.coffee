Ember.Application.initializer
  name: 'currentUser'

  initialize: (container) ->
    store = container.lookup('store:main')
    attributes = $('meta[name="current-user"]').attr('content')

    if attributes
      object = store.load(TaskManagement.User, JSON.parse(attributes))
      user = TaskManagement.User.find(object.id)

      controller = container.lookup('controller:currentUser').set('content', user)

      container.typeInjection('controller', 'currentUser', 'controller:currentUser')
      container.typeInjection('route', 'currentUser', 'controller:currentUser')
