TaskManagement.Task = DS.Model.extend
  description: DS.attr('string')
  state: DS.attr('string')
  created_at: DS.attr('isodate')

  owner: DS.belongsTo('TaskManagement.User')
  performer: DS.belongsTo('TaskManagement.User')

