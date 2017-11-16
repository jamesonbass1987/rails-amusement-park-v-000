module UsersHelper

  def text_for_admin(user)
    "ADMIN" if user.is_admin?
  end

end
