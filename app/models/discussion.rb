class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

    def comments_count
  	comments.count 
  end

end
