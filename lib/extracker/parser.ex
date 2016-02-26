defmodule ExTracker.Parser do
  @moduledoc """
  Parse API results into custom types.
  """

  @doc """
  Parse me record from the API response json.
  """
  @spec parse_me(Map.t) :: ExTracker.Record.Me.t
  def parse_me(object) do
    me = struct(ExTracker.Record.Me, object)

    %{ me | time_zone:          parse_time_zone(me.time_zone),
            personal_settings:  parse_personal_settings(me.personal_settings),
            projects:           parse_membership_summaries(me.projects)
      }
  end

  @doc """
  Parse personal settings from the API response json.
  """
  @spec parse_personal_settings(Map.t | nil) :: ExTracker.Record.PersonlSettings.t | nil
  def parse_personal_settings(nil), do: nil
  def parse_personal_settings(object) do
    struct(ExTracker.Record.PersonlSettings, object)
  end

  @doc """
  Parse time zone from the API response json.
  """
  @spec parse_time_zone(Map.t) :: ExTracker.Record.TimeZone.t
  def parse_time_zone(object) do
    struct(ExTracker.Record.TimeZone, object)
  end

  @doc """
  Parse projects from the API response json.
  """
  @spec parse_membership_summaries([Map.t] | nil) :: [ExTracker.Record.MembershipSummary.t] | nil
  def parse_membership_summaries(nil), do: nil
  def parse_membership_summaries(object) do
    object |> Enum.map(&ExTracker.Parser.parse_membership_summary/1)
  end

  @doc """
  Parse membership_summary from the API response json.
  """
  @spec parse_membership_summary(Map.t) :: ExTracker.Record.MembershipSummary.t
  def parse_membership_summary(object) do
    struct(ExTracker.Record.MembershipSummary, object)
  end

  @doc """
  Parse projects from the API response json.
  """
  @spec parse_projects([Map.t] | nil) :: [ExTracker.Record.Project.t] | nil
  def parse_projects(nil), do: nil
  def parse_projects(object) do
    object |> Enum.map(&ExTracker.Parser.parse_project/1)
  end

  @doc """
  Parse project from the API response json.
  """
  @spec parse_project(Map.t | nil) :: ExTracker.Record.Project.t
  def parse_project(nil), do: nil
  def parse_project(object) do
    project = struct(ExTracker.Record.Project, object)

    %{  project | time_zone:  parse_time_zone(project.time_zone),
                  account:    parse_account(project.account),
                  epics:      parse_epics(project.epics),
                  labels:     parse_labels(project.labels)
      }
  end

  @doc """
  Parse account from the API response json.
  """
  @spec parse_account(Map.t | nil) :: ExTracker.Record.Account.t
  def parse_account(nil), do: nil
  def parse_account(object) do
    struct(ExTracker.Record.Account, object)
  end

  @doc """
  Parse epics from the API response json.
  """
  @spec parse_epics([Map.t] | nil) :: [ExTracker.Record.Epic.t] | nil
  def parse_epics(nil), do: nil
  def parse_epics(object) do
    object |> Enum.map(&ExTracker.Parser.parse_epic/1)
  end

  @doc """
  Parse epic from the API response json.
  """
  @spec parse_epic(Map.t) :: ExTracker.Record.Epic.t
  def parse_epic(object) do
    epic = struct(ExTracker.Record.Epic, object)
    %{ epic | label: parse_label(epic.label) }
  end

  @doc """
  Parse labels from the API response json.
  """
  @spec parse_labels([Map.t] | nil) :: [ExTracker.Record.Label.t] | nil
  def parse_labels(nil), do: nil
  def parse_labels(object) do
    object |> Enum.map(&ExTracker.Parser.parse_label/1)
  end

  @doc """
  Parse label from the API response json.
  """
  @spec parse_label(Map.t) :: ExTracker.Record.Label.t
  def parse_label(object) do
    struct(ExTracker.Record.Label, object)
  end

  @doc """
  Parse stories from the API response json.
  """
  @spec parse_stories([Map.t] | nil) :: [ExTracker.Record.Story.t] | nil
  def parse_stories(nil), do: nil
  def parse_stories(object) do
    object |> Enum.map(&ExTracker.Parser.parse_story/1)
  end

  @doc """
  Parse story from the API response json.
  """
  @spec parse_story(Map.t) :: ExTracker.Record.Story.t
  def parse_story(object) do
    struct(ExTracker.Record.Story, object)
  end

  @doc """
  Parse story transactions from the API response json.
  """
  @spec parse_story_transactions([Map.t] | nil) :: [ExTracker.Record.StoryTransaction.t] | nil
  def parse_story_transactions(nil), do: nil
  def parse_story_transactions(object) do
    object |> Enum.map(&ExTracker.Parser.parse_story_transaction/1)
  end

  @doc """
  Parse story transactions from the API response json.
  """
  @spec parse_story_transaction(Map.t) :: ExTracker.Record.StoryTransaction.t
  def parse_story_transaction(object) do
    struct(ExTracker.Record.StoryTransaction, object)
  end

  @doc """
  Parse cicle time details from the API response json.
  """
  @spec parse_cicle_time_details(Map.t) :: ExTracker.Record.CicleTimeDetails.t
  def parse_cicle_time_details(object) do
    struct(ExTracker.Record.CicleTimeDetails, object)
  end
end
