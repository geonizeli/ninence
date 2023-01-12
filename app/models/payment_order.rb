class PaymentOrder < ApplicationRecord
  belongs_to :originator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
end
