
class Profile < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
  belongs_to :user, inverse_of: :profile

end
