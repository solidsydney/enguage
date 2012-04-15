class AddRegNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :reg_number, :string
  end
end
