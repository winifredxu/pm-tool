class Tag < ActiveRecord::Base
   has_many :taggings, dependent: :destroy
   has_many :projects, through: :taggings
   default_scope { order("title ASC") }
end
