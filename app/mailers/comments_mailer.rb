class CommentsMailer < ApplicationMailer
  def notify_discussion_owner(discussion)
     @user = @discussion.user
     mail to: @user.email, subject: "Ahoy hoy!"
  end
end
