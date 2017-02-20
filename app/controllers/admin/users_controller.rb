module Admin
  class UsersController < Admin::AdminApplicationController
    load_and_authorize_resource :user, :parent => false

    def index
      @users = User.all
    end

    def new
      @user.build_profile
    end

    def edit
      unless @user.profile.present?
        @user.build_profile
      end
    end

    def update
      @user.update_attributes(user_params)
      redirect_to action: :index
    end

    def show
    end

    def create
      if @user.save
        redirect_to action: :index
      else
        redirect_to :back
      end
    end

    protected

    def user_params
      permitted_params = %i(email password password_confirmation )
      params.require(:user).permit(permitted_params +
      [role_ids: []] +
      [profile_attributes:
        [:id, :date_of_birth, :location, :name, :twitter, :facebook, :snapchat, :linkedin, :instagram, :description, :email, :phone, :locale, :avatar]])
    end

  end
end
