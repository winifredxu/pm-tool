class Task < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :user
  
  validates  :title, presence: true

  default_scope { order("due_date ASC") }

end
