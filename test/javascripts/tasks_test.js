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
  Ember.run(function() {
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
});

test("/tasks:new", function() {
  expect(2);

  visit("/tasks").then(function() {
    equal(0, find(":contains('<><>Do the dishes!<><>')").length);
    return click('.btn-new-task')
  }).then(function() {
    fillIn('#description', '<><>Do the dishes!<><>')
    return click('[type=submit]')
  }).then(function() {
    ok(exists("*"), '<><>Do the dishes!<><>');

    test("/tasks:view", function() {
      expect(2);

      visit("/tasks").then(function() {
        ok(exists("*"), '<><>Do the dishes!<><>');
        return click('.btn-view-task', "tr:contains('<><>Do the dishes!<><>')");
      }).then(function() {
        ok(exists("*"), '<><>Do the dishes!<><>');
        return click('.btn');
      }).then(function() {
        test("/tasks:edit", function() {
          expect(3);

          visit("/tasks").then(function() {
            ok(exists("*"), '<><>Do the dishes!<><>');
            return click('.btn-edit-task', "tr:contains('<><>Do the dishes!<><>')");
          }).then(function() {
            fillIn('#description', '<><>Done!<><>')
            return click('[type=submit]')
          }).then(function() {
            ok(exists("*"), '<><>Done!<><>');
            equal(0, find(":contains('<><>Do the dishes!<><>')").length);

            test("/tasks:delete", function() {
              expect(2);

              visit("/tasks").then(function() {
                ok(exists("*"), '<><>Done!<><>');
                return click('.btn-delete-task', "tr:contains('<><>Done!<><>')");
              }).then(function() {
                equal(0, find(":contains('<><>Done!<><>')").length);
              });
            });

          });
        });
      });
    });
  });
});



