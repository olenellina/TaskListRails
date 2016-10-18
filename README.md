### Reflection
What went well:
I really enjoyed this project and feel like rails is making sense to me. The requirements were described well but there were also a few opportunities to make my own design decisions and I enjoyed that (for example, deciding that once completed, a record should not be updated, only deleted). 

What are you still working on understanding better:
I'm still wanting to develop a better understanding of the rails project structure; there are a lot of files/folders that we didn't need to work with for this project. I’m almost thinking that I’ll spend some time playing around with Sinatra to see if it enables me to learn more about starting from scratch. I tried to get a feature working where you could be looking at the show page for a particular task and have a "previous" and "next" task button that could scroll through the tasks in your database. I was able to get it working using some online resources but ended up getting rid of that code because it was dependent on the database records being continuous. Lastly, I'd really like build in tests like we have been using for stand-alone Ruby projects. 

What did your chair pair do differently:
One of my chair pairs implemented the optional "partials" for her buttons and I'd love to try that!


# Task List Rails ✅
We are going to build a Task List in Rails. This web application will enable us to keep track of list of tasks with the functionality to add, edit and remove tasks from a list.

Tracking tasks in a web app will let us focus on following Rails conventions and learning how data flows through a Rails application.

## Baseline
**Once you've achieved this baseline, take a walk around the room and see if you can answer questions or help other folks.**

This project...

- Will have our standard Github setup (fork this repo and clone to your machine)
- requires you to create a Rails application
  - create a controller for your `Tasks`
  - conform to Rails conventions on naming and inflection

Baseline Part 2:
- create a `Task` model and migration.
  - create the database schema and tables with `rake db:migrate`
  - the `Task` model should include _at least_ a name, a description and a completion indicator

Tinker with your Model in the `rails console` in order to ensure you have created your model and can interact with it as expected.

## Task Data Requirements

Each task record will include all of the following. Optional in this context means that the user may choose not to provide this information, but it is still required for your schema:
- Self-incrementing identifier (ID)
- title: the title of the task
- description: details about the task
- completed_at: the time and date the task was completed

## 🌊 Wave 1
This wave is where we will introduce the view layer to interact with our application via the browser.

- Set up necessary controller(s) and route(s) that you will need in order to show a task from the database
- Create a root route for your application that directs users to the list of all tasks
  - Each task name in the list should link to a `show` action that will render a new view for the user.
  - The `show` view should include the complete information about the task: name, description, completion status, and completion date.
- All markup in all views should have semantic relevance.


## 🌊 Wave 2
In this wave we will add the first set of user interactivity and persistence.

- Be able to create a new task:
  - The home page should contain a link to Add a new task. This will give the user a form to fill out with the appropriate task fields.
  - After the new task is added, the site should take the user back to the home page which displays the full list of tasks. The new task that was just added should be included in the full list of tasks.
- Be able to delete an existing task:
  - Add a route and controller action whose responsibility is deleting a task (RESTful routes)
  - On the home page, add a button or link for each task that will, once clicked...
    1. Ask the user to confirm that they definitely want to delete the task.
    1. Delete the task from the database and redirect the user back to the list of remaining tasks

## 🌊 Wave 3
In this wave we will extend the interactivity with users, allowing them to edit existing tasks in a couple of different ways. As always, follow _RESTful_ conventions when implementing these features.

- Add the ability for the user to mark a task complete
  - Add a button to the list of tasks on the home page that, when clicked, will mark a task complete.
  - Update the database with the task's completed date
- Add the ability for the user to edit a task's details.
  - Add an `edit` action that renders a form allowing the user to update all the fields of a task.
  - Submitting the form from the `edit` action should _update_ the existing task; not create a new one.
    - Research: ActiveRecord's `update` method.
  - Link to the `edit` action from the task's `show` page.
  - DRY up your code by reusing the view code from the `new` functionality
    - Hint: Rendering _partials_ in Rails.

 
