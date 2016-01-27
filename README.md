https://github.com/dashofcode/extracker

[![Build Status](https://travis-ci.org/dashofcode/extracker.svg)](https://travis-ci.org/dashofcode/extracker)
[![Coverage Status](http://img.shields.io/coveralls/dashofcode/extracker.svg)](https://coveralls.io/r/dashofcode/extracker)
[![Inline docs](http://inch-ci.org/github/dashofcode/extracker.svg)](http://inch-ci.org/github/dashofcode/extracker)

# ExTracker

Simple Elixir wrapper for the [Pivotal Tracker API](https://www.pivotaltracker.com/help/api).

Based heavily on the [Tentacat](https://github.com/edgurgel/tentacat) library.

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
* [ ] Me
* [ ] Notifications
* [ ] Project
* [ ] Project History
* [ ] Project Integrations
* [ ] Project Memberships
* [ ] Project Webhooks
* [ ] Projects
* [ ] Reports
* [ ] Request Aggregator
* [ ] Search
* [ ] Source Commits
* [ ] Stories
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
