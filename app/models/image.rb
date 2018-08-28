class Image < ActiveRecord::Base
  self.inheritance_column = :object_type
end
