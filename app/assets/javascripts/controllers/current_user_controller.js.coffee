TaskManagement.CurrentUserController = Ember.ObjectController.extend
  isSignedIn: (->
    @get('content') != null
  ).property('@content')
