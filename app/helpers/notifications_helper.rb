module NotificationsHelper
#Member::
   def notification_form(notification)
      @visiter = notification.visiter
      @comment = nil
      link_to 'あなたの投稿', members_favorite_path(notification), style:"font-weight: bold;"
      @visiter_comment = notification.comment_id
      #notification.actionがfollowかlikeかcommentか
      case notification.action
        when "follow" then
          tag.a(notification.visiter.name, href:members_member_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
        when "favorite" then
          tag.a(notification.visiter.name, href:members_member_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:members_favorite_path(notification.favorite_id), style:"font-weight: bold;")+"にいいねしました"
        when "comment" then
            @comment = Comment.find_by(id: @visiter_comment)&.content
            tag.a(@visiter.name, href:members_member_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:members_favorite_path(notification.favorite_id), style:"font-weight: bold;")+"にコメントしました"
      end
   end

   def unchecked_notifications
    @notifications = current_member.passive_notifications.where(checked: false)
   end
end
