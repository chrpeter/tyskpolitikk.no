module UsersHelper

  def get_name_or_email(user)
    if user.profile && user.profile.name.present?
      user.profile.name
    else
      user.email
    end
  end
end
