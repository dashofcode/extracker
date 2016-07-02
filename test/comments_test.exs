defmodule ExTracker.CommentsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import ExTracker.Comments

  doctest ExTracker.Comments

  alias ExTracker.Support.Helpers
  alias ExTracker.Record.Comment

  @client ExTracker.Client.new(%{access_token: Helpers.pt_user_1.token})
  @project_id Helpers.pt_user_1.project_id
  @story_id Helpers.pt_user_1.story_id

  setup_all do
    HTTPoison.start
  end

  test "create/4" do
    use_cassette "comments#create" do
      %Comment{text: text} = create(
        @client, @project_id, @story_id, %{text: "Sup from test"}
      )
      assert text == "Sup from test"
    end
  end
end
