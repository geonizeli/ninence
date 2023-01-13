class RemoveDescriptionFromPaymentOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :payment_orders, :description, :string
  end
end
