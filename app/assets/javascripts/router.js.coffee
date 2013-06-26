TaskManagement.Router.map (match)->
  @resource 'tasks', ->
    @route 'new'
    @resource 'task', ->
      @route 'edit', { path: 'edit/:task_id'}
      @route 'view', { path: '/:task_id'}

