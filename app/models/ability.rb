# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Jeżeli użytkownik nie jest zalogowany to nie ma żadnych uprawnień
    return unless user

    # Każdy zalogowany może przeglądać mecze
    can :read, Match

    # Każdy może czytać komunikaty
    can :read, Notification

    # Każdy może dodawać i czytać komentarze
    can %i[read create], Comment

    if user.admin?
      # Tylko administrator może zarządzać meczami
      can :manage, Match
      # Może zarządzać komunikatami
      can :manage, Notification
      # Może zarządzać użytkownikami
      can :manage, User
    end
  end
end
