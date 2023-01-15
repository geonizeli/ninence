ActiveAdmin.register User do
  config.batch_actions = false

  permit_params :name, :email, :password, :password_confirmation

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  controller do
    def update
      if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end

      super
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password, required: false
      f.input :password_confirmation, required: false
    end
    f.actions
  end

  index do
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
    end
  end
end
