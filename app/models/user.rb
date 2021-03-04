class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :tweets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :myinfo
          validates :password, format: { with:/\A[a-zA-Z0-9]+\z/}
          validates :password, length: { maximum: 12}
         end

end
