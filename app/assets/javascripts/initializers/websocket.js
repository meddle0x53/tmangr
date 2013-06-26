TaskManagement.Sock = Ember.Object.extend({
  key: null,

  init: function() {
    this.dispatcher = new WebSocketRails('localhost:3000/websocket');

    this.dispatcher.on_open = function() {console.log('conected')};
  },

  subscribe: function(channel) {
    var _this = this;

    this.channel = this.dispatcher.subscribe(channel);
    this.channel.bind('task.create', function(data) {_this.handleEvent('task.create', data)});
    this.channel.bind('task.update', function(data) {_this.handleEvent('task.update', data)});
    this.channel.bind('task.destroy', function(data) {_this.handleEvent('task.destroy', data)});
  },

  handleEvent: function(eventName, data) {
    var router, unhandled;

    router = this.get("container").lookup("router:main");
    try {
      console.log(eventName)
      router.send(eventName, data);
    } catch (e) {
      unhandled = e.message.match(/Nothing handled the event/);
    }
  }
});

Ember.Application.initializer({
  name: "sock",
  initialize: function(container, application) {
    container.optionsForType('sock', { singleton: true });

    container.register('sock:main', application.Sock);

    container.typeInjection('controller', 'sock', 'sock:main');
    container.typeInjection('route', 'sock', 'sock:main');
  }
});

Ember.ControllerMixin.reopen({
  sock: null
});
