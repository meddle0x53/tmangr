TaskManagement.TasksFormView = Em.View.extend
  tagName: 'form'
  classNames: 'form-horizontal modal fade in form-custom-field-modal'.w()
  didInsertElement: ->
    @$().modal 'show'
  willDestroyElement: ->
    @$().modal 'hide'
