# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], Post
    can :destroy, Post, author: user

    return unless user.admin?
    can :destroy, Post
   end
end
