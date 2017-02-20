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

# Enumerations are based on Single Table Inheritance (http://api.rubyonrails.org/classes/ActiveRecord/Base.html#label-Single+table+inheritance).
# The name of the enum class is by default stored in the column named "type".
module Enum
  class Enumeration < ActiveRecord::Base
    validates :type, presence: true
    validates :ordinal, presence: true, uniqueness: { scope: :type }

    scope :sorted_on_ordinal, -> { order(:ordinal) }

    # Defining #hash and #eql? makes it possible to use an Enumeration as a hash key
    def hash
      i18n_key.hash
    end

    def eql?(other)
      i18n_key == other.i18n_key
    end

    def to_s
      translate_value :i18n_key
    end

    def self.by_i18n_key(i18n_key)
      find_by_i18n_key(i18n_key.to_s)
    end

    def self.by_i18n_keys(*i18n_key)
      where(i18n_key: i18n_key.map(&:to_s))
    end

    def translate_value(col_name, options={})
      child_key_name = options.delete(:child_key)
      tv = I18n.translate(i18n_key_for_value(col_name, child_key_name), options.reverse_merge(rescue_format: :html))
      tv.is_a?(Hash) && tv.has_key?(:default) ? tv[:default] : tv
    end
    def i18n_key_for_value(col_name, child_key=nil)
      sub_key = child_key.nil? ? "" : ".#{child_key}"
      "activerecord.values.#{self.class.model_name.i18n_key}.#{col_name}.#{self.read_attribute(col_name)}#{sub_key}"
    end
  end
end
