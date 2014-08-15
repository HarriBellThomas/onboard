class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :stripe_token
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
