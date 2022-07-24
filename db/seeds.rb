100.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    preferences: Faker::Beer.brand
  )
end

50.times do
  Post.create(name: Faker::Movie.title)
end
