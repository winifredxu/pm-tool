class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  default_scope { order("updated_at ASC") }

  def comments_count
  	comments.count 
  end

end
