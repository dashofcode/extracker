defmodule ExTracker.Stories do
  import ExTracker
  alias Extracker.Client

  @doc """
  Get a single `story`.

  ## Example

      ExTracker.Stories.find("12345", "67890", client)

  More info at: https://www.pivotaltracker.com/help/api/rest/v5#Story
  """
  @spec find(pos_integer, pos_integer, Client.t, [{atom, binary}] | []) :: ExTracker.Record.Story.t
  def find(project_id, story_id, client, params \\ []) do
    get("projects/#{project_id}/stories/#{story_id}", client, params)
    |> ExTracker.Parser.parse_story
  end


  @doc """
  Get all stories from project

  ## Example

      ExTracker.Stories.list(client, project_id)

  More info at:https://www.pivotaltracker.com/help/api/rest/v5#Stories
  """
  @spec list(Client.t, pos_integer, [{atom, binary}] | []) :: [ExTracker.Record.Story.t] | []
  def list(client, project_id, params \\ []) do
    get("projects/#{project_id}/stories", client, params)
    |> ExTracker.Parser.parse_stories
  end
end
