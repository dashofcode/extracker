defmodule ExTracker.Record.Me do
  defstruct [:id, :name, :initials, :username, :time_zone, :api_token,
              :has_google_identity, :project_ids, :projects, :workspace_ids,
              :email, :receives_in_app_notifications, :kind, :personal_settings]

  @type t :: %ExTracker.Record.Me{
    id:                             pos_integer,
    name:                           binary,
    initials:                       binary,
    username:                       binary,
    time_zone:                      ExTracker.Record.TimeZone.t,
    api_token:                      binary,
    has_google_identity:            boolean,
    project_ids:                    [pos_integer],
    projects:                       [ExTracker.Record.Project.t],
    workspace_ids:                  [pos_integer],
    email:                          binary,
    receives_in_app_notifications:  boolean,
    kind:                           binary,
    personal_settings:              ExTracker.Record.PersonlSettings.t
  }
end

defmodule ExTracker.Record.PersonlSettings do
  defstruct [:header_display_mode, :kind]

  @type t :: %ExTracker.Record.PersonlSettings{
    header_display_mode:  binary,
    kind:                 binary
  }
end

defmodule ExTracker.Record.TimeZone do
  defstruct [:olson_name, :offset, :kind]

  @type t :: %ExTracker.Record.TimeZone{
    olson_name:   binary,
    offset:       binary,
    kind:         binary
  }
end

defmodule ExTracker.Record.MembershipSummary do
  defstruct [:id, :project_id, :project_name, :project_color, :role,
              :last_viewed_at, :kind]

  @type t :: %ExTracker.Record.MembershipSummary{
    id:               pos_integer,
    project_id:       pos_integer,
    project_name:     binary,
    project_color:    binary,
    role:             binary,
    last_viewed_at:   binary,
    kind:             binary
  }
end

defmodule ExTracker.Record.Project do
  defstruct [:id, :name, :version, :iteration_length, :week_start_day,
              :point_scale, :point_scale_is_custom, :bugs_and_chores_are_estimatable,
              :automatic_planning, :enable_tasks, :start_date, :time_zone,
              :velocity_averaged_over, :shown_iterations_start_time,
              :start_time, :number_of_done_iterations_to_show, :has_google_domain,
              :description, :profile_content, :enable_incoming_emails,
              :initial_velocity, :project_type, :public, :atom_enabled,
              :current_iteration_number, :current_velocity, :current_volatility,
              :account_id, :account, :story_ids, :epic_ids, :epics, :membership_ids,
              :label_ids, :labels, :integration_ids, :iteration_override_numbers,
              :created_at, :updated_at, :kind]

  @type t :: %ExTracker.Record.Project{
    id:                                 pos_integer,
    name:                               binary,
    version:                            pos_integer,
    iteration_length:                   pos_integer,
    week_start_day:                     binary,
    point_scale:                        binary,
    point_scale_is_custom:              boolean,
    bugs_and_chores_are_estimatable:    boolean,
    automatic_planning:                 boolean,
    enable_tasks:                       boolean,
    start_date:                         binary,
    time_zone:                          ExTracker.Record.TimeZone.t,
    velocity_averaged_over:             pos_integer,
    shown_iterations_start_time:        binary,
    start_time:                         binary,
    number_of_done_iterations_to_show:  pos_integer,
    has_google_domain:                  boolean,
    description:                        binary,
    profile_content:                    binary,
    enable_incoming_emails:             boolean,
    initial_velocity:                   non_neg_integer,
    project_type:                       binary,
    public:                             boolean,
    atom_enabled:                       boolean,
    current_iteration_number:           pos_integer,
    current_velocity:                   non_neg_integer,
    current_volatility:                 float,
    account_id:                         pos_integer,
    account:                            ExTracker.Record.Account.t,
    story_ids:                          [pos_integer],
    epic_ids:                           [pos_integer],
    epics:                              [ExTracker.Record.Epic.t],
    membership_ids:                     [pos_integer],
    label_ids:                          [pos_integer],
    labels:                             [ExTracker.Record.Label.t],
    integration_ids:                    [pos_integer],
    iteration_override_numbers:         [pos_integer],
    created_at:                         binary,
    updated_at:                         binary,
    kind:                               binary
  }
end

defmodule ExTracker.Record.Epic do
  defstruct [:id, :name, :description, :label_id, :label, :project_id, :url, :kind]

  @type t :: %ExTracker.Record.Epic{
    id:           pos_integer,
    name:         binary,
    description:  binary,
    label_id:     pos_integer,
    label:        ExTracker.Record.Label.t,
    project_id:   pos_integer,
    url:          binary,
    kind:         binary
  }
end

defmodule ExTracker.Record.Label do
  defstruct [:id, :name, :project_id, :counts, :kind]

  @type t :: %ExTracker.Record.Label{
    id:           pos_integer,
    name:         binary,
    project_id:   pos_integer,
    counts:       pos_integer,
    kind:         binary
  }
end

defmodule ExTracker.Record.Account do
  defstruct [:id, :name, :kind]

  @type t :: %ExTracker.Record.Account{
    id:           pos_integer,
    name:         binary,
    kind:         binary
  }
end
