# Has Many Through Selection App

In this Rails 5.1 example app we can manage a Group and its Members using one form with checkboxes.

## Setup

```sh
$ bin/setup
$ bin/rails server
```

## Description

We are using `Group.accepts_nested_attributes_for :memberships, allow_destroy: true` so we can pass `memberships_attributes` when creating/updating a Group. An example of the `params` object for a creating request looks like this:

```
"group" => {
  "name"=>"Food",
  "memberships_attributes" => {
    "0"=>{"user_id"=>"1", "_destroy"=>"0"},
    "1"=>{"user_id"=>"2", "_destroy"=>"0"},
    "2"=>{"user_id"=>"3", "_destroy"=>"0"},
    "3"=>{"user_id"=>"4", "_destroy"=>"1"},
    "4"=>{"user_id"=>"5", "_destroy"=>"1"},
    "5"=>{"user_id"=>"6", "_destroy"=>"1"}
  }
}
```

With this, the Group will be created having Memberships for Users with id 1, 2 and 3 because the value for `_destroy` is `'0'`.

When updating the Group, it might look like this:

```
"group" => {
  "name"=>"Food",
  "memberships_attributes" => {
    "0"=>{"user_id"=>"1", "_destroy"=>"0", "id"=>"24"},
    "1"=>{"user_id"=>"2", "_destroy"=>"0", "id"=>"25"},
    "2"=>{"user_id"=>"3", "_destroy"=>"1", "id"=>"26"},
    "3"=>{"user_id"=>"4", "_destroy"=>"1"},
    "4"=>{"user_id"=>"5", "_destroy"=>"1"},
    "5"=>{"user_id"=>"6", "_destroy"=>"1"}
  }
}
```

Here we keep the first two Memberships and remove the third.

## The Important Code Parts

- app/models/group.rb
- app/models/membership.rb
- app/controllers/groups_controller.rb
- app/views/groups/_form.html.erb

## Remark

You will see inline local variable assignments in the _form.html.erb, that's not how we would usually write code like it. In this case we make an exception so we don't have to browse just another file to see the important parts.
