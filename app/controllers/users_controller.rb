class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def new
    render "new"
  end

  def create
    firstname = params[:first_name]
    lastname = params[:last_name]
    email = params[:email]
    password = params[:password]
    user = User.new(
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to sessions_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
