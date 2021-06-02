class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    user = User.find_by(email: email)
    if user && user.authenticate(params[:password])
      render plain: "You have "
    else
      render plain: "password wrong"
    end
  end
end