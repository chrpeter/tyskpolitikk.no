require 'mime/types'

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class AdminApplicationController < ApplicationController
    before_action :authentication_user
    before_action :admin_panel

    def admin_panel
      @admin_panel = true
    end
    def authentication_user
        unless user_signed_in?
          redirect_to new_user_session_path, :notice => 'if you want to add a notice'
        end
      # TODO Add authentication logic here.
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
