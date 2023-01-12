class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  enumerize :role, in: [:guest, :admin], default: :guest

  self.role.values.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end
end
