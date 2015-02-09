class Task < ActiveRecord::Base
  
  belongs_to :project
  
  validates  :title, presence: true

  default_scope { order("due_date ASC") }

end
