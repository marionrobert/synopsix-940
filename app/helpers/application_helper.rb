module ApplicationHelper
  def find_user_avatar
    if current_user.photo.attached?
      return current_user.photo.key
    else
      return 'avatar'
    end
  end
end
