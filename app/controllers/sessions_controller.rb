class SessionsController < ApplicationController
  before_action :find_params
  def destroy

  end

  def create
    flash[:notice] = "Welcome #{@user.email}"
    redirect_to root_path
  end

  private

    def find_params
      @user = User.find_by(email: params[:email])
        &.authenticate(params[:password])
    end
end
