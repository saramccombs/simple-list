# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  - A `User` has many `Ideaboards`.
  - An `Ideaboard` has many `Lists`.
  - A `List` has many `Tasks`.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  - An `Ideaboard` belongs to a `User`.
  - A `List` belongs to a `User`.
  - A `List` belongs to an `Ideaboard`.
  - A `Task` belongs to a `List`.
  - A `Task` belongs to a `User`.

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  - A `User` has many `Lists` through `Ideaboards`.
  - A `User` has many `Tasks` through `Lists`.
  - An `Ideaboard` has many `Tasks` through `Lists`.

- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

- [x] Include reasonable validations for simple model objects
  - A `user` must have a name
  - A `user` must have a unique username
  - A `user` must have a unique email address (devise)
  - A `user`'s password cannot be blank and has a 6 characters minimum (devise)
  - An `ideaboard` must have a name
  - A `list` must have a name
  - A `task` must have a description and a priority

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)

- [x] Include third party signup/login (Devise/OmniAuth)
  - Signin via GitHub permitted.

- [x] Include nested resource show or index
  - `/users/:user_id/ideaboards/:id` (ideaboards#show)
  - `/users/:user_id/ideaboards/:ideaboard_id/lists/:id` (lists#show)

- [x] Include nested resource "new" form
  - `/users/:user_id/ideaboards/new` (ideaboards#new)
  - `/users/:user_id/ideaboards/:ideaboard_id/lists/new` (lists#new)
  - `/users/:user_id/ideaboards/:ideaboard_id/lists/:list_id/tasks/new` (tasks#new)

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY

- [ ] Limited logic in controllers

- [x] Views use helper methods if appropriate
  - have both a `find_ideaboard` and a `find_list` helper methods

- [x] Views use partials if appropriate
  - There are `_jumbotron_ideaboards` and `_jumbotron_lists` partials
  - Devise has a `_shared_links` partial
