class Project < ActiveRecord::Base
	has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  has_many :members, dependent: :destroy
  has_many :project_members, through: :members, source: :user



  #has_many :users, through: :members
  
  default_scope { order("due_date ASC") }
  
  validates :title, presence: true


  def self.search(search)
    where("title ILIKE ? OR description ILIKE ?", "%#{search}%","%#{search}%")
  end

  extend FriendlyId
  friendly_id :title, use: :slugged


  # def to_param
  #   "#{id}-#{title}".parameterize
  # end

end
