defmodule ExTracker.Support.Helpers do
  # These API Tokens are for a user with just one Public Sample Project
  def pt_user_1 do
    %{ username: "trackerapi1", password: "trackerapi1", token: "d55c3bc1f74346b843ca84ba340b29bf", project_id: 1027488 }
  end

  def pt_user_2 do
    %{ username: "trackerapi2", password: "trackerapi2", token: "ab4c5895f57995bb7547986eacf91160", project_id: 1027492 }
  end

  def pt_user_3 do
    %{ username: "trackerapi3", password: "trackerapi3", token: "77f9b9a466c436e6456939208c84c973", project_id: 1027494 }
  end
end
