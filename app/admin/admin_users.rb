ActiveAdmin.register AdminUser do
  index do
    column :email
    column :full_name
    column :last_sign_in_at
    column :last_sign_in_ip
  end
  
end
