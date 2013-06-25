DS.RESTAdapter.registerTransform "isodate", {
  deserialize: (serialized) ->
    return new Date(serialized).format('yy-MM-dd hh:mm:ss')

  serialize: (deserialized) ->
    return deserialized
}

DS.RESTAdapter.map 'TaskManagement.Task', {
  owner: { embedded: 'load' }
  performer: { embedded: 'load' }
}

TaskManagement.Store = DS.Store.extend
  revision: 4
  adapter: DS.RESTAdapter.create({
    namespace: 'api/v1'
  })

