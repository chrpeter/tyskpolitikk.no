
# Define abilities for the passed in user here. For example:
#
#   user ||= User.new # guest user (not logged in)
#   if user.admin?
#     can :manage, :all
#   else
#     can :read, :all
#   end
#
# The first argument to `can` is the action you are giving the user
# permission to do.
# If you pass :manage it will apply to every action. Other common actions
# here are :read, :create, :update and :destroy.
#
# The second argument is the resource the user can perform the action on.
# If you pass :all it will apply to every resource. Otherwise pass a Ruby
# class of the resource.
#
# The third argument is an optional hash of conditions to further filter the
# objects.
# For example, here the user can only update published articles.
#
#   can :update, Article, :published => true
#
# See the wiki for details:
# https://github.com/ryanb/cancan/wiki/Defining-Abilities

class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.roles.present?
      @user = user
      @user_id = @user.id
      user.roles.each do |role|
        send(role.name.to_sym)
      end
      default_user
    end
    default
  end

  def admin
    can :manage, :all
    can :add_role, :all
  end

  def editor
    can :manage, :all
    can :add_role, :all
  end

  def writer
    can :manage, [NewsArticle, CommentArticle]
  end

  def default_user
    can :update, Profile, user_id: @user_id
    can :update, User, id: @user_id
  end

  def default
    can :read, BaseArticle do |base_article|
      base_article.public == true
    end
  end
end
