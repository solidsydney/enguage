class CreateReferers < ActiveRecord::Migration
  def change
    create_table :referers do |t|
      t.string :name

      t.timestamps
    end
  end
end
