class CreatePaymentOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_orders do |t|
      t.string :title, null: false
      t.string :description
      t.datetime :paid_at
      t.references :originator, index: true, foreign_key: { to_table: :users }
      t.references :assignee, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
