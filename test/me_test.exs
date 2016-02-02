defmodule ExTracker.MeTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import ExTracker.Me

  doctest ExTracker.Me

  alias ExTracker.Support.Helpers
  alias ExTracker.Record.Me

  @client ExTracker.Client.new(%{access_token: Helpers.pt_user_1.token})

  setup_all do
    HTTPoison.start
  end

  test "get/1" do
    use_cassette "me#get" do
      %Me{username: username} = get(@client)
      assert username == Helpers.pt_user_1.username
    end
  end
end
