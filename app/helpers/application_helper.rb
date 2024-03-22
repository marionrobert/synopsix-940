module ApplicationHelper
  def find_user_avatar
    if current_user.photo.attached?
      return current_user.photo.key
    else
      first_user = User.first
      return first_user.photo.key
    end
  end
end
