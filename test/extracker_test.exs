defmodule ExTrackerTest do
  use ExUnit.Case
  import ExTracker

  doctest ExTracker

  setup_all do
    :meck.new(Poison.Parser, [:no_link])

    on_exit fn ->
      :meck.unload(Poison.Parser)
    end
  end

  test "authorization_header using access token" do
    assert authorization_header(%{access_token: "9820103"}, []) == [{"X-TrackerToken", "9820103"}]
  end

  test "process response on a 200 response" do
    :meck.expect(Poison.Parser, :parse!, 1, :decoded_json)
    assert process_response(%HTTPoison.Response{ status_code: 200,
                                                 headers: %{},
                                                 body: "json" }) == :decoded_json
    assert :meck.validate(Poison.Parser)
  end

  test "process response on a non-200 response" do
    :meck.expect(Poison.Parser, :parse!, 1, :decoded_json)
    assert process_response(%HTTPoison.Response{ status_code: 404,
                                                 headers: %{},
                                                 body: "json" }) == {404, :decoded_json}
    assert :meck.validate(Poison.Parser)
  end

  test "process response on a non-200 response and empty body" do
    assert process_response(%HTTPoison.Response{ status_code: 404,
                                                 headers: %{},
                                                 body: "" }) == {404, nil}
  end
end
