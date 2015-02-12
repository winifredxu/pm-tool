class Comment < ActiveRecord::Base
  belongs_to :discussion

  validates :body, presence: true

  def comments_count
  	discussion.comments.count 
  end
end
