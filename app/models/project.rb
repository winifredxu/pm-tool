class Project < ActiveRecord::Base
  belongs_to :user
  
	has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  has_many :members, dependent: :destroy
  has_many :project_members, through: :members, source: :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  default_scope { order("due_date ASC") }
  
  validates :title, presence: true


  def self.search(search)
    where("title ILIKE ? OR description ILIKE ?", "%#{search}%","%#{search}%")
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

end
