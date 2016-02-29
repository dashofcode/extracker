https://github.com/dashofcode/extracker

[![Build Status](https://travis-ci.org/dashofcode/extracker.svg)](https://travis-ci.org/dashofcode/extracker)
[![Coverage Status](http://img.shields.io/coveralls/dashofcode/extracker.svg)](https://coveralls.io/r/dashofcode/extracker)
[![Inline docs](http://inch-ci.org/github/dashofcode/extracker.svg)](http://inch-ci.org/github/dashofcode/extracker)

# ExTracker

Simple Elixir wrapper for the [Pivotal Tracker API](https://www.pivotaltracker.com/help/api).

Based heavily on the [Tentacat](https://github.com/edgurgel/tentacat) and [ExTwiter](https://github.com/parroty/extwitter) libraries.

## Features

* [ ] Account
* [ ] Account Memberships
* [ ] Accounts
* [ ] Activity
* [ ] Attachments
* [ ] Comments
* [ ] Epic
* [ ] Epics
* [ ] Exports
* [ ] Iterations
* [ ] Labels
* [x] Me
  * [x] Get
  * [ ] Put
* [ ] Notifications
* [x] Project
  * [x] Get
  * [ ] Put
  * [ ] Delete
* [ ] Project History
* [ ] Project Integrations
* [ ] Project Memberships
* [ ] Project Webhooks
* [x] Projects
  * [x] Get
  * [ ] Post
* [ ] Reports
* [ ] Request Aggregator
* [ ] Search
* [ ] Source Commits
* [x] Stories
  * [x] Get
* [ ] Story
* [ ] Story Tasks
* [ ] Story Transitions
* [ ] Workspaces

Documentation can be found [here](https://hexdocs.pm/extracker)

## Quickstart

1. Add extracker to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:extracker, "~> 0.1"}]
  end
  ```

2. Ensure extracker is started before your application:

  ```elixir
  def application do
    [applications: [:extracker]]
  end
  ```

## Examples

  ```elixir
  # Create a client.
  iex> client = ExTracker.Client.new(%{access_token: "d55c3bc1f74346b843ca84ba340b29bf"})
  %ExTracker.Client{auth: %{access_token: "d55c3bc1f74346b843ca84ba340b29bf"},
   endpoint: "https://www.pivotaltracker.com/services/v5/"}

  # Get project including epics and the epic's label.
  iex>   %ExTracker.Record.Project{name: name, epics: epics} =
  ...>       ExTracker.Projects.find(1027488,
  ...>                               client,
  ...>                               fields: ":default,epics(:default,label(name))")
  %ExTracker.Record.Project{number_of_done_iterations_to_show: 12,
   point_scale: "0,1,2,3", week_start_day: "Monday",
   iteration_override_numbers: nil, enable_tasks: true, story_ids: nil,
   membership_ids: nil, created_at: "2014-03-02T07:11:04Z", integration_ids: nil,
   start_time: "2014-02-10T08:00:00Z", has_google_domain: false,
   current_iteration_number: 104, label_ids: nil,
   time_zone: %ExTracker.Record.TimeZone{kind: "time_zone", offset: "-08:00",
    olson_name: "America/Los_Angeles"}, labels: nil, current_volatility: nil,
   bugs_and_chores_are_estimatable: false, iteration_length: 1,
   name: "My Sample Project", epic_ids: nil,
   profile_content: "This is a demo project, created by Tracker, with example stories for a simple shopping web site.",
   description: nil, account: nil, start_date: nil,
   updated_at: "2014-03-02T07:11:04Z", initial_velocity: 10,
   velocity_averaged_over: 3, automatic_planning: true, id: 1027488,
   atom_enabled: false, project_type: "demo", account_id: 621384,
   epics: [%ExTracker.Record.Epic{description: "Get the Admin users working on the site",
     id: 1087314, kind: "epic",
     label: %ExTracker.Record.Label{counts: nil, id: 7849080, kind: nil,
      name: "admin", project_id: nil}, label_id: nil, name: "Admin Users",
     project_id: 1027488,
     url: "https://www.pivotaltracker.com/epic/show/1087314"},
    %ExTracker.Record.Epic{description: "Allow shoppers to use the site",
     id: 1087316, kind: "epic",
     label: %ExTracker.Record.Label{counts: nil, id: 7849082, kind: nil,
      name: "shopping", project_id: nil}, label_id: nil, name: "Shoppers",
     project_id: 1027488,
     url: "https://www.pivotaltracker.com/epic/show/1087316"}], public: false,
   current_velocity: nil, kind: "project", version: 80,
   shown_iterations_start_time: nil, enable_incoming_emails: true,
   point_scale_is_custom: false}

   iex> name
   "My Sample Project"

   iex> [%ExTracker.Record.Epic{name: epic_name, label: %ExTracker.Record.Label{name: label_name}} | _] = epics
   iex> epic_name
   "Admin Users"
   iex> label_name
   "admin"
  ```
