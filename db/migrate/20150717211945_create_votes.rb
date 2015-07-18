class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, foreign_key: true
      t.references :post,  foreign_key: true

      t.timestamps null: false
    end
    add_index :votes, :user_id
    add_index :votes, :post_id
  end
end
