5.times do |chef|
  Chef.create!(
    name: "Chef #{chef}",
    email: Faker::Internet.email
    )
    password_digest: "123456"
    )
end

puts "5 chefs created"

5.times do |recipe|
  Recipe.create!(
    name: "Recipe #{recipe}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    chef_id: 1
    )

end

puts "5 recipes created"


