class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    todo_new = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    unless todo_new.save
      flash[:error] = todo_new.errors.full_messages.join(", ")
    end
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
