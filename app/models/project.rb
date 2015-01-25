class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  default_scope { order("due_date ASC") }
  validates :title, presence: true
end
