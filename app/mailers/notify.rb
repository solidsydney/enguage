class Notify < ActionMailer::Base
  default from: "from@example.com"
  def send_email(user)
    @user = user
    mail :to => user.email, :subject => "Welcome to enguage", :from => "enguage.rzaartz.com"
  end
end
