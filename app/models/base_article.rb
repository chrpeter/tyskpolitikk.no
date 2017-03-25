
class BaseArticle < ActiveRecord::Base
  self.inheritance_column = :object_type
  has_and_belongs_to_many :users, class_name: 'User', join_table: 'base_articles_users'
  mount_uploader :header_photo, AvatarUploader
  belongs_to :owner, :class_name => 'User'
  self.per_page = 10
  scope :public_article, -> { where(public: true) }

  # ------ INSTANCE methods -------------------
  def news?
    instance_of?(NewsArticle)
  end

  def article?
    instance_of?(CommentArticle)
  end

  def slug
     title.downcase.gsub(" ", "-")
  end

  def to_param
    "#{id}-#{slug.tr(',.;', '')}"
  end


end
