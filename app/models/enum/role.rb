# == Schema Information
#
# Table name: enumerations
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  ordinal    :integer          not null
#  i18n_key   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

module Enum
  class Role < Enumeration

  	ALL = [:poweruser, :admin, :editor, :writer]
    has_and_belongs_to_many :users, class_name: '::User', join_table: 'roles_users'

    scope :editor, -> { where('enumerations.i18n_key = ?', :editor) }

    # Create class methods for all statuses
    ALL.each do |name|
      define_singleton_method name.to_sym do
        by_i18n_key(name)
      end
      define_method "is_#{name}?" do
        is?(name)
      end
  	end

    def is?(status)
      name == status.to_sym
    end

    def name
      i18n_key.to_sym
    end

  end
end
