class Discussion < ActiveRecord::Base
  belongs_to :task
  has_many :comments, dependent: :destroy

 	validates :title, presence: true 
 	validates :description, presence: true

 	  def project
    task.question
  end

end
