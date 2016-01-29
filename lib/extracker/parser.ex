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
  @spec parse_project(Map.t) :: ExTracker.Record.Project.t
  def parse_project(object) do
    project = struct(ExTracker.Record.Project, object)

    %{project | time_zone: parse_time_zone(project.time_zone)}
  end

end
