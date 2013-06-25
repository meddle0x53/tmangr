//= require application
//= require_tree .
//= require_self

// login:
$('head').append('<meta content="{&quot;id&quot;:4,&quot;email&quot;:&quot;meddle@abv.bg&quot;}" name="current-user">');
 
document.write('<div id="ember-testing-container"><div id="ember-content"></div></div>');
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>');
 
TaskManagement.rootElement = '#ember-content';
TaskManagement.setupForTesting();
TaskManagement.injectTestHelpers();
TaskManagement.Store = DS.Store.extend({
  adapter: 'DS.FixtureAdapter'
});

TaskManagement.User.FIXTURES = [
  {
    id: 1,
    email: 'meddle@abv.bg'
  },
  {
    id: 2,
    email: 'meddle2@abv.bg'
  },
  {
    id: 3,
    email: 'tanya@abv.bg'
  }
];

TaskManagement.Task.FIXTURES = [
  { 
    id: 1,
    description: 'Task 1',
    state: 'opened',
    created_at: '2005-04-05 12:00:00',
    owner: 1,
    performer: 2 
  },
  { 
    id: 2,
    description: 'Task 2',
    state: 'opened',
    created_at: '2004-04-05 12:00:00',
    owner: 2,
    performer: 3
  }
];
 
function exists(selector) {
  return !!find(selector).length;
}
