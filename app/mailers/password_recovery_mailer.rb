class PasswordRecoveryMailer < ApplicationMailer
  default from: 'from@example.com'

  def recover(password_recovery)
    @password_recovery = password_recovery
    @user = password_recovery.user
    mail(to: password_recovery.user.email, subject: 'Password recovery')
  end
end
