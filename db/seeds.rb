if User.none?
  10.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "1234asdf"
    )
  end
  puts "Created dummy users"
end

unless User.exists?(:admin)
  User.create!(
    name: "Admin",
    email: "admin@test.com",
    password: "testtest",
    admin: true
  )
  puts "Created admin user with email: admin@test.com and password: testtest"
end

if Article.none?
  20.times do
    Article.create!(
      title: Faker::Commerce.product_name,
      body: Faker::Lorem.paragraphs(number: 5).join,
      user: User.all.sample
    )
  end
  puts "Created dummy articles"
end
