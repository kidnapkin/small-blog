User.create!(name:  'Eugene Domotenko',
             email: 'e.domotenko@gmail.com',
             password:              'foobar',
             password_confirmation: 'foobar',
             admin: true)

20.times do |n|
  name  = Faker::Name.name
  email = "user-#{n + 1}@small.org"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
  title = Faker::Hipster.sentence(1)
  content = Faker::Lorem.sentence(25)
  users.each { |user| user.posts.create!(title: title, content: content) }
end
