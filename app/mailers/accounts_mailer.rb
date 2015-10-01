class AccountsMailer < ApplicationMailer

  def notify_acount_owner(user)
    @user        = user
    mail(to: @user.email, subject: "You've got a comment!")
  end

end
