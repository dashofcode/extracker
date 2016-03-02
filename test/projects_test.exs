defmodule ExTracker.ProjectsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import ExTracker.Projects

  doctest ExTracker.Projects

  alias ExTracker.Support.Helpers
  alias ExTracker.Record.Project
  alias ExTracker.Record.Epic
  alias ExTracker.Record.Label
  alias ExTracker.Record.Account

  @client ExTracker.Client.new(%{access_token: Helpers.pt_user_1.token})
  @project_id Helpers.pt_user_1.project_id

  setup_all do
    HTTPoison.start
  end

  test "find/3" do
    use_cassette "projects#find" do
      %Project{name: name, week_start_day: week_start_day} = find(@client, @project_id)
      assert name == "My Sample Project"
      assert week_start_day == "Monday"
    end
  end

  test "find/3 with fields param" do
    use_cassette "projects#find and include epics and epic label" do
      %Project{name: name, epics: epics} =
          find(@client, @project_id,
                fields: ":default,epics(:default,label(name))")
      assert name == "My Sample Project"
      assert length(epics) > 1

      [%Epic{name: name, label: %Label{name: label_name}} | _] = epics
      assert name == "Admin Users"
      assert label_name == "admin"
    end
  end

  test "list/1" do
    use_cassette "projects#list" do
      projects = list(@client)
      assert length(projects) == 1

      [%Project{name: name} | _] = projects
      assert name == "My Sample Project"
    end
  end

  test "list/1 with fields param" do
    use_cassette "projects#list and include account and current_velocity and labels" do
      projects = list(@client, fields: ":default,account,current_velocity,labels(name)")
      assert length(projects) == 1

      [%Project{name: name,
                account: %Account{name: account_name},
                current_velocity: current_velocity,
                labels: labels} | _] = projects

      assert name == "My Sample Project"
      assert account_name == "Trackher User1"
      assert current_velocity == 10
      assert length(labels) == 23

      assert Enum.any?(labels, fn(%Label{name: name}) ->
        "admin" == name
      end)
    end
  end
end
