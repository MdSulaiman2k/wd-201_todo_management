class User < ApplicationRecord
  def to_pleasent_string
    "#{id}.  #{name}  #{email} "
  end
end
