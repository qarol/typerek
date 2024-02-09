# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # If the user is not logged in, they have no permissions
    return unless user

    # Every logged-in user can view matches
    can :read, Match

    # Everyone can read notifications
    can :read, Notification

    # Everyone can add and read comments
    can %i[read create], Comment

    return unless user.admin?

    # Only the administrator can manage matches
    can :manage, Match
    # Only the administrator can manage notifications
    can :manage, Notification
    # Only the administrator can manage users
    can :manage, User
  end
end
