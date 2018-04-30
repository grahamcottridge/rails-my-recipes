Chef.create!(
  name: "Graham",
  email: "graham@example.com",
  password_digest: BCrypt::Password.create('123456'),
  admin: true,
  photo: Faker::Avatar.image
  )

puts "1 admin user created"

Chef.create!(
  name: "Bob",
  email: "bob@example.com",
  password_digest: BCrypt::Password.create('123456'),
  admin: false,
  photo: Faker::Avatar.image
  )

puts "1 user created"

8.times do |chef|
  Chef.create!(
    name: Faker::LordOfTheRings.character,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create('123456'),
    admin: false,
    photo: Faker::Avatar.image
    )
end

puts "8 chefs created"

2.times do |recipe|
  Recipe.create!(
    name: Faker::Food.dish,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    chef_id: 1
    )
end

2.times do |recipe|
  Recipe.create!(
    name: Faker::Food.dish,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    chef_id: 2
    )
end

2.times do |recipe|
  Recipe.create!(
    name: Faker::Food.dish,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    chef_id: 3
    )
end

2.times do |recipe|
  Recipe.create!(
    name: Faker::Food.dish,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    chef_id: 4
    )
end

2.times do |recipe|
  Recipe.create!(
    name: Faker::Food.dish,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    chef_id: 5
    )
end

puts "10 recipes created"

10.times do |ingredient|
  Ingredient.create!(
    name: Faker::Food.ingredient
    )
end

puts "10 ingredients created"

