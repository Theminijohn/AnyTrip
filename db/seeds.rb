# Whitelist
Whitelist.create!(email: 'the@minijohn.me')

# Create User
u = User.new
u.email = 'the@minijohn.me'
u.first_name = 'The Mini John'
u.last_name = 'The Mini John'
u.password = '12345678'
u.password_confirmation = '12345678'
u.save!
