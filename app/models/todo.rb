class Todo < ActiveRecord::Base
  def self.overdue
    all.where(" due_date< ?", Date.today).order(:due_date, :id)
  end

  def self.due_today
    all.where("due_date= ?", Date.today).order(:due_date, :id)
  end

  def self.due_later
    all.where("due_date> ?", Date.today).order(:due_date, :id)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }

    puts "\n\n"
    puts "Due Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end

  def to_pleasent_string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id} .  #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def self.completed
    all.where(completed: true)
  end

  def self.notcompleted
    all.where(completed: false)
  end
end
