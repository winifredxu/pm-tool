class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  has_many :discussions, dependent: :destroy
  has_many :comments, dependent: :nullify

  has_many :members, dependent: :destroy
  has_many :member_projects, through: :members, source: :project

  has_many :favorites, dependent: :destroy
  has_many :favorited_projects, through: :favorites, source: :project


  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end

  def has_favorited?(project)
    favorited_projects.include? project
  end

end
