class User < ApplicationRecord
  has_many :todos

  def to_pleasent_string
    "#{id}.  #{name}  #{email} "
  end
end
