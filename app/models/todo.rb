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

  def self.completed
    all.where(completed: true)
  end

  def self.notcompleted
    all.where(completed: false)
  end
end
