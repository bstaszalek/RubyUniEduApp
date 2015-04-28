class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, Article
      can :manage, Comment
    else
      can :create, Comment
      can :manage, Comment do |comment|
        comment.try(:commenter) == user.email
      end
      can :read, :all
    end
  end
end
