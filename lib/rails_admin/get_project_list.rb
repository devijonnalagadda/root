module RailsAdmin
  module Config
    module Actions
      class GetProjectList < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:object].class == Organization
        end
        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'fa fa-paper-plane'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end
        register_instance_option :controller do
          Proc.new do
            @organization = Organization.find(params[:id])
            @users = @organization.users
            puts "================="
            puts @users
            puts "=================="
            render :get_project_list
          end
        end
      end
    end
  end
end