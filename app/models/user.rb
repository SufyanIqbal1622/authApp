class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  belongs_to :role
  delegate :name, to: :role
  def admin?
     self.name == 'Admin'
  end

  def manager?
     self.name == 'Manager'
  end
  def user?
     self.name == 'User'
  end
end
