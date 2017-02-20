

class User < ActiveRecord::Base
  has_one :profile, inverse_of: :user, dependent: :destroy
  has_many :base_articles
  has_and_belongs_to_many :roles, class_name: 'Enum::Role', join_table: 'roles_users'
  has_and_belongs_to_many :base_articles, class_name: 'BaseArticle', join_table: 'base_articles_users'

  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

end
