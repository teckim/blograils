class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[read create], Post
    can %i[read create], Comment
    can :destroy, Post, author: user
    can :destroy, Comment, author: user

    return unless user&.admin?

    can :destroy, Post
    can :destroy, Comment
  end
end
