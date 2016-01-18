# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Review.delete_all
Place.delete_all
User.delete_all

10.times do |u|
  User.create! name: "User#{u}", email: "test#{u}@testaccount.com", password: "testtest"
end

 seed_place = ["Central", "Wan Chai", "Chai Wan", "Ap Lei Chau", "Kowloon City", "Wong Tai Sin", "Kwun Tong", 
 	            "Yau Ma Tei", "Tsim Sha Tsui", "Mong Kok", "Sham Shui Po", "Tsuen Wan", "Kwai Chung",
 	            "Sai Kung", "Sha Tin", "Tai Po", "Tuen Mun", "Yuen Long", "Lantau Island"]

  seed_place.each do |p|
    Place.create! name: p, address: p + ", Hong Kong", description: p, phone: 852, website: "p", user: User.all.sample
  end

  200.times do |r|
    Review.create! content: "Review no. #{r}", score: Random.rand(1..5), place: Place.all.sample, user: User.all.sample
  end