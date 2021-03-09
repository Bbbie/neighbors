module ApplicationHelper
  default_avatars = ['empty-avatar_1.svg', 'empty-avatar_2.svg', 'empty-avatar_3.svg', 'empty-avatar_4.svg']
  CURRENT_AVATAR = default_avatars.sample

  def navbar_avatar_for(profile)
    @avatar = profile.avatar
    @avatar_user = image_tag(CURRENT_AVATAR, class: "avatar-big dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
    return @avatar_user
  end

  def index_avatar_for(profile)
    @avatar = profile.avatar
    @avatar_user = image_tag(CURRENT_AVATAR, class: "avatar-big")
    return @avatar_user
  end

  def list_avatar_for(profile)
    @avatar = profile.avatar
    @avatar_user = image_tag(CURRENT_AVATAR, class: "avatar-small-list")
    return @avatar_user
  end

  def profile_avatar_for(profile)
    @avatar = profile.avatar
    @avatar_user = image_tag(CURRENT_AVATAR, class: "profile-picture")
    return @avatar_user
  end
end
