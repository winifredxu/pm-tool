class Project < ActiveRecord::Base
	has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  default_scope { order("due_date ASC") }
  validates :title, presence: true

  def self.search(search)
    where("title ILIKE ? OR description ILIKE ?", "%#{search}%","%#{search}%")
  end
end
