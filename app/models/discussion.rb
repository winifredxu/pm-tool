class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  default_scope { order("updated_at DESC") }

  def comments_count
  	comments.count 
  end

end
