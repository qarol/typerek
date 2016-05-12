module UsersHelper
  def display_username(username)
    username || content_tag(:i, 'użytkownik skasowany', class: 'text-muted')
  end
end
