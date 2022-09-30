# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], Post
    can [:read, :create], Comment
    can :destroy, Post, author: user
    can :destroy, Comment, author: user

    return unless user && user.admin?
    can :destroy, Post
    can :destroy, Comment
   end
end
