class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_id
      t.references :post, index: true

      t.timestamps
    end
  end
end
