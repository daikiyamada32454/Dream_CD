class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :tweet,        null:false
      t.text :image
      t.timestamps
    end
  end
end
