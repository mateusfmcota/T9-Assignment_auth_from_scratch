class PasswordController < ApplicationController
  def edit

  end

  def create
    u = User.find_by_email(params[:email])

    unless u.present?
      flash[:alert] = 'Error in request'
      render :edit, status: :unprocessable_entity
    end

    password_recovery = PasswordRecovery.new
    password_recovery.user = u
    password_recovery.token = SecureRandom.uuid

    if password_recovery.save
      PasswordRecoveryMailer.recover(password_recovery).deliver_now
    end

  end

  def update
    @password_recovery = PasswordRecovery.find_by_token(params[:id])

    @user = @password_recovery.user
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      flash[:notice] = 'Your password has been updated'
      @password_recovery.destroy
      redirect_to root_path
    else
      flash[:alert] = 'password cannot be updated'
      render :edit, status: :unprocessable_entity
    end
  end
end
