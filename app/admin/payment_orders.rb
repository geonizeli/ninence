ActiveAdmin.register PaymentOrder do
  permit_params :title, :description, :paid_at, :originator_id, :assignee_id, :billet, :receipt

  show do
    attributes_table do
      row :title
      row :description
      row :paid_at
      row :originator
      row :assignee
      row :billet do |ad|
        link_to ad.billet.filename, url_for(ad.billet)
      end
      row :receipt do |ad|
        link_to ad.receipt.filename, url_for(ad.receipt)
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.input :billet, as: :file
    f.input :receipt, as: :file
    f.actions
  end
end
