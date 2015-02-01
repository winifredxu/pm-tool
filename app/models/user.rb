class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :nullify
  has_many :tasks, dependent: :nullify

  has_many :discussions, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :members, dependent: :nullify
  has_many :projects_with_members, through: :members, source: :project


end
