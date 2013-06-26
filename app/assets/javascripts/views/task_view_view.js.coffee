TaskManagement.TaskViewView = Em.View.extend
  classNames: 'modal fade in'.w()
  didInsertElement: ->
    @$().modal 'show'
  willDestroyElement: ->
    @$().modal 'hide'
