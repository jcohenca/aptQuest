class UserMailer < ActionMailer::Base
  default from: "aptquest.mailer@gmail.com"



  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My aptQuest - We hope to help you find the idea apartment!')
  end



end
