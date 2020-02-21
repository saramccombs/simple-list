# Project Notes

Various personal notes regarding my project.

----

## Model: Users

- has_many ideaboards
- has_many lists, through ideaboards
- has_many tasks, through lists

### User Attributes

- id
- name
- username
- password (devise)
- email (devise)
- provider (devise)
- uid (devise)

### User Views & Actions

- New/Create: Handled by Devise.
- Edit/Update: Handled by Devise.
- Show (Application#Show): shows all user information with links to edit or delete.
- Index (Application#Hello): shows all ideaboards with a list count badge.

----

## Model: Ideaboards

Acts as a join table for users & lists.

- belong_to user
- has_many lists
- has_many tasks, through lists

### Ideaboard Attributes

- id
- ideaboard_name
- ideaboard_desc
- user_id (FK)

### Ideaboard Views & Actions

- New/Create: create new ideaboard.
- Edit/Update: edit existing ideaboard.
- Show: shows all lists with task count badge, shows edit and delete board links.
- Index: None

----

## Model: Lists

Acts as a join table for users and tasks.

- belongs_to user
- belongs_to ideaboard
- has_many tasks

### List Attributes

Acts as a join table for ideaboards and tasks.

- id
- list_name
- list_desc
- user_id (FK)
- ideaboard_id (FK)

### List Views & Actions

- New/Create: creates new list.
- Edit/Update: edits existing list.
- Show: Shows tasks associated with list and their priority level.
- Index: None

----

## Model: Tasks

- belongs_to user
- belongs_to list

No direct relationship from tasks to ideaboards as `belongs_to :ideaboard, through: :lists` doesn't exist as a relationship type.

### Task Attributes

- id
- task_desc
- task_priority
- user_id (FK)
- list_id (FK)

### Task Views & Actions

- New/Create: creates a new task.
- Edit/Update: edits an existing task.
- Show: None
- Index: None
