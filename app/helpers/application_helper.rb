module ApplicationHelper
  def avatar_for(profile)
    default_avatars = ['empty-avatar_1.svg', 'empty-avatar_2.svg', 'empty-avatar_3.svg', 'empty-avatar_4.svg']
    @avatar = profile.avatar
    @avatar_user = image_tag(default_avatars.sample, class: "avatar-big dropdown-toggle")
    return @avatar_user
  end
end
