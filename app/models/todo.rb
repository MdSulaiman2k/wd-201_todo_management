class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  def self.overdue
    where(" due_date< ?", Date.today).order(:due_date, :id)
  end

  def self.due_today
    where("due_date= ?", Date.today).order(:due_date, :id)
  end

  def self.due_later
    where("due_date> ?", Date.today).order(:due_date, :id)
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
