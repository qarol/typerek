class Ability
  include CanCan::Ability

  def initialize(user)
    # Jeżeli użytkownik nie jest zalogowany to nie ma żadnych uprawnień
    return unless user

    # Każdy zalogowany może przeglądać mecze
    can :read, Match

    # Każdy może dodawać i czytać komentarze
    can [:read, :create], Comment

    if user.admin?
      # Tylko administrator może zarządzać meczami
      can :manage, Match
    end
  end
end
