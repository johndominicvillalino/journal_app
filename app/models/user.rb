class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  has_many :categories, :dependent => :destroy
  has_many :tasks, through: :categories
  validates :email, presence: true,  uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true
end
