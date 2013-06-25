module("Ember.js Tasks", {
  setup: function() {
    Ember.run(TaskManagement, TaskManagement.advanceReadiness);
  },

  teardown: function() {
    //TaskManagement.reset();
  }
});

// Just check html...
test("/", function() {
  expect(1);

  visit("/").then(function() {
    ok(exists("*"), "HTML?");
  });
});

test("/tasks", function() {
  expect(TaskManagement.Task.FIXTURES.length);

  visit("/tasks").then(function() {
    var i, tasks = TaskManagement.Task.FIXTURES;
    for (i = 0; i < tasks.length; i++) {
      task = tasks[i];
      ok(exists("td:contains('" + tasks[i].description + "')"), "Tasks are listed.");
    }
  });
});


test("/tasks:sort", function() {
  var task, store, expected = '<><>Should be first!<><>'
  expect(1);

  task = TaskManagement.Task.find(1);
  store = task.get('store')
  store.createRecord(TaskManagement.Task, {
    description: expected,
    state: 'opened',
    created_at: '2986-04-27 12:10:11',
    owner: TaskManagement.User.find(1),
    performer: TaskManagement.User.find(3)
  });

  visit("/tasks").then(function() {
    return click("a:contains('Description')")
  }).then(function() {
    first_desc = $.trim(find('tbody tr:first td.task-description').text())
    equal(expected, first_desc)
  });
});
