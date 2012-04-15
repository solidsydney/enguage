class AddFullNameToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :full_name, :string
  end
end
