class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

         has_many :tweets
         has_many :comments
         
         with_options presence: true do
          validates :nickname,format: { with:/\A[ぁ-んァ-ン一-龥]/}
          validates :myinfo.format: { with:/\A[ぁ-んァ-ン一-龥]/}
         end

end
