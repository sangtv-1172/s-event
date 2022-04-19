RailsAdmin.config do |config|
  config.asset_source = :webpacker

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  
  # Provide application name
  config.main_app_name = ["Experiment With Rails Admin", ""]
  # Include the models in the navigation
  # config.included_models = ["Event", "EventType", "Task", "Topic", "User"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  RailsAdmin.config do |config|
    config.model "User" do
      list do
        field :first_name
        field :last_name
      end

      show do
        field :first_name
        field :last_name
      end
    end

    # config.model "Event" do
    #   list do
    #     configure :user do
    #       pretty_value do
    #         util = bindings[:object]
    #           %{<a href="#{ bindings[:view].rails_admin.edit_path(model_name: 'user', id: util.user.id)}">#{util.user.last_name}</a>}.html_safe
    #       end
    #       children_fields [:name, :phone, :logo] # will be used for searching/filtering, first field will be used for sorting
    #       read_only true # won't be editable in forms (alternatively, hide it in edit section)
    #     end
        
    #     sort_by :name
    #   end
    # end
  end
end