class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.integer :alarm_id
      t.integer :vote_count

      t.timestamps
    end
  end
end
