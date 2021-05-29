class UsersController < ApplicationController
  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasent_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "You are registered successfully with an id #{user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where("email = ?", email).first
    if user == nil
      render plain: "false"
    elsif user.password == password
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
