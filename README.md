Tmangr
======

Tmangr is a simple task management system. An user can assign chores or tasks to himself/herself or to another user in the system.
The idea of this application is to show an ember.js application with Rails backend.
Ember data is used as storage.
Websockets are use for dynamic updates.

## Instalation
This installation guide will show you how to install and run the application, even if you are new to ruby and rails.
This guede is for developer using real OS - Unix based, if you use windows read how to install ruby and rails from the net, I don't use windows, I don't know and I don't care.

1. Install ruby (skip that if you are rubist)

  1.1. Install ruby version managent system - RVM
  ```
  curl -L https://get.rvm.io | bash
  rvm requirements
  ```
  1.2. Make sure you follow the instructions that are presented to you by the requirements command.
  1.3. Install Ruby
  ```
  rvm install ruby-2.0.0-p195 
  ```
  1.4. Set the default ruby to be the one you installed
  ```
  rvm use --default 2.0.0
  ```
  1.5 You now have ruby! If you want futher information about ruby installation and RVM check out my blog post about it - http://goo.gl/7xiMW4
2. Clone this application. I assume you have git installed.
```
git clone https://github.com/meddle0x53/tmangr.git
```
3. Install Rails and the dependencies of this application.
```
cd tmangr
bundle install
```
4. Setup the database used be the application (don't worry it is in-memory/file db)
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```
5. Run the application. The application will run on localhost:3000 by default.
```
rails s
```
6. Navigate with modern browser to the application on http://localhost:3000
7. Log in as the user 'meddle@tmangr.com' with password '123456'
8. Play arround!

## Running the tests
This application has both client side and server side integration and unit tests.

1. Run the client side tests from the browser. Open http://localhost:3000/qunit
2. Source code for the client tests can be found in the 'test/javascript' folder.
