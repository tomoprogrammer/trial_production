class CreateMoney < ActiveRecord::Migration[5.2]
  def change
    create_table :money do |t|
      t.integer :user_id
      t.integer :payment
      t.string :memo

      t.timestamps
    end
  end
end
