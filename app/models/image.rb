class Image < ActiveRecord::Base
  self.inheritance_column = :object_type
  mount_uploader :image_file, AvatarUploader
end
