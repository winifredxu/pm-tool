class Task < ActiveRecord::Base
  belongs_to :project
  has_many :discussions, dependent: :destroy


end
