class Comment < ActiveRecord::Base
  belongs_to :discussion

  def comments_count
  	discussion.comments.count 
  end
end
