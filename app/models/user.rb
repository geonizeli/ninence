class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  enumerize :role, in: [:user, :admin], default: :user
end
