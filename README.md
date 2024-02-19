# Has Many Through Selection App

In this Rails 7.1 example app we can manage a Group and its Members using one form with checkboxes.

![Manage Group](https://raw.githubusercontent.com/tbuehlmann/has-many-through-selection/master/group.png "Manage Group")

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

With this, the Group will be created having Memberships for Users with id 1, 2 and 3 because the value for `_destroy` is `"0"`.

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

- [app/models/group.rb](https://github.com/tbuehlmann/has-many-through-selection/blob/master/app/models/group.rb#L2-L5)
- [app/models/membership.rb](https://github.com/tbuehlmann/has-many-through-selection/blob/master/app/models/membership.rb#L3)
- [app/controllers/groups_controller.rb](https://github.com/tbuehlmann/has-many-through-selection/blob/master/app/controllers/groups_controller.rb#L49-L51)
- [app/views/groups/_form.html.erb](https://github.com/tbuehlmann/has-many-through-selection/blob/master/app/views/groups/_form.html.erb#L22-L36)
