class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_user_type

  enum user_type: {
    'customer': 1,
    'employee': 2
  }


private
  def set_user_type
    self.user_type = 'customer'
  end
end
