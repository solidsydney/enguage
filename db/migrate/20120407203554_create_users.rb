class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :referer_id
      t.string :address
      t.text :mission
      t.string :payment_plan

      t.timestamps
    end
  end
end
