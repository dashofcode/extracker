defmodule ExTracker.ClientTest do
  use ExUnit.Case
  import ExTracker.Client

  doctest ExTracker.Client

  test "default endpoint" do
    client = new(%{})
    assert client.endpoint == "https://www.pivotaltracker.com/services/v5/"
  end

  test "custom endpoint" do
    expected = "https://wer.foo.com/services/v3/"

    client = new(%{}, "https://wer.foo.com/services/v3/")
    assert client.endpoint == expected

    # when tailing '/' is missing
    client = new(%{}, "https://wer.foo.com/services/v3")
    assert client.endpoint == expected
  end
end
