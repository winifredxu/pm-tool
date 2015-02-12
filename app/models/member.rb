class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :project, presence: true, uniqueness: { scope: :user }
  validates :user, presence: true

end
