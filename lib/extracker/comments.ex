defmodule ExTracker.Comments do
  import ExTracker
  alias Extracker.Client

  @doc """
  Create a single `comment`.

  ## Example

      ExTracker.Comments.create(client, '1027488', '66727974', %{text: "Hello World From Elixir"})

  More info at: https://www.pivotaltracker.com/help/api/rest/v5#projects_project_id_stories_story_id_comments_post
  """
  @spec create(Client.t, pos_integer, pos_integer, {atom, binary}) :: ExTracker.Record.Comment.t
  def create(client, project_id, story_id, params) do
    post("projects/#{project_id}/stories/#{story_id}/comments", client, params)
    |> ExTracker.Parser.parse_comment
  end
end
