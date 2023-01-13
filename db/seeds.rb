admin_user_email = 'admin@example.com'

if User.find_by(email: admin_user_email).nil?
  User.create!(email: admin_user_email, password: 'password', password_confirmation: 'password', role: :admin)
end

guest_user_email = 'guest@example.com'

if User.find_by(email: guest_user_email).nil?
  User.create!(email: guest_user_email, password: 'password', password_confirmation: 'password', role: :guest)
end