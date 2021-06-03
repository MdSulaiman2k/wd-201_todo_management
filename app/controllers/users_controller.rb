class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
    #render "index"
  end

  def new
    render "new"
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasent_string
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
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
