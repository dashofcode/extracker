defmodule ExTracker.Projects do
  import ExTracker
  alias ExTracker.Client

  @doc """
  Get a single `project`.

  ## Example

      ExTracker.Projects.find(client, "12345")

  More info at: https://www.pivotaltracker.com/help/api/rest/v5#Project
  """
  @spec find(Client.t, pos_integer, [{atom, binary}] | []) :: ExTracker.Record.Project.t
  def find(client, project_id, params \\ []) do
    get("projects/#{project_id}", client, params)
    |> ExTracker.Parser.parse_project
  end

  @doc """
  Get all projects.

  ## Example

      ExTracker.Projects.list(client)

  More info at: https://www.pivotaltracker.com/help/api/rest/v5#Project
  """
  @spec list(Client.t, [{atom, binary}] | []) :: [ExTracker.Record.Project.t] | []
  def list(client, params \\ []) do
    get("projects", client, params)
    |> ExTracker.Parser.parse_projects
    # |> IO.inspect
  end

end
