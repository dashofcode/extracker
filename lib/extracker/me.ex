defmodule ExTracker.Me do
  import ExTracker
  alias ExTracker.Client

  @doc """
  Returns information from the user's profile plus the list of
  projects to which the user has access.

  ## Example

      ExTracker.Me.get(client)

  More info at: https://www.pivotaltracker.com/help/api/rest/v5#Me
  """
  @spec get(Client.t) :: ExTracker.response
  def get(client) do
    get("me", client)
  end
end
