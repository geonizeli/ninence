ActiveAdmin.register PaymentOrder do
  config.batch_actions = false

  filter :title
  filter :paid_at
  filter :created_at
  filter :updated_at

  permit_params :title, :paid_at, :originator_id, :assignee_id, :billet, :receipt

  before_create do |payment_order|
    payment_order.originator = current_user
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.input :billet, as: :file
    f.input :receipt, as: :file
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :paid_at
      row :originator
      row :assignee
      row :billet do |file|
        link_to file.billet.filename, url_for(file.billet) if file.billet.attached?
      end
      row :receipt do |file|
        link_to file.receipt.filename, url_for(file.receipt) if file.receipt.attached?
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
