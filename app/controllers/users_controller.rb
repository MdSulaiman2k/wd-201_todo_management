class UsersController < ApplicationController
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
    user = User.create!(
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
    )
    # response_text = "You are registered successfully with an id #{user.id}"
    # render plain: response_text
    redirect_to "/"
  end
end
