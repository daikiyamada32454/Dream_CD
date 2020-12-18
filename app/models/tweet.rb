class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :play
    validates :description
  end
end
