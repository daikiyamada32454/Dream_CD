class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :tweets
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :myinfo
          validates :password, format: { with:/\A[a-zA-Z0-9]+\z/}
          validates :password, length: { maximum: 12}
         end


         def follow(other_user)
          unless self == other_user
            self.relationships.find_or_create_by(follow_id: other_user.id)
          end
        end
      
        def unfollow(other_user)
          relationship = self.relationships.find_by(follow_id: other_user.id)
          relationship.destroy if relationship
        end
      
        def following?(other_user)
          self.followings.include?(other_user)
        end
end
