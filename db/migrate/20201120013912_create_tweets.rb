class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :description,        null:false
      t.string :play,               null:false
      t.text :image
      t.timestamps
    end
  end
end
