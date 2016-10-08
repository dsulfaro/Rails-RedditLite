# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)


(1..4).each do |num|
  User.create!(username: num.to_s, password: "123456")
end

Sub.create!(title: "Mugs", user_id: 1)
Sub.create!(title: "Cups", user_id: 2)

Post.create!(title: "Mug Life", url: "www.google.com", user_id: 3, sub_ids: [1,2])
Post.create!(title: "Cup you!", content: "Except there's nothing to cup!",
            sub_ids: [1,2], user_id: 4)
Post.create!(title: "Welcome", user_id: 1, sub_ids: [1])
Post.create!(title: "Welcome", user_id: 2, sub_ids: [2])
