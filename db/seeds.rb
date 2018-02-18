# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#if ENV["user"]
	6.times do
		User.create!(
	  		name:     Faker::Name.name,
	    	email:    Faker::Internet.unique.email,
	    	password: Faker::Crypto.md5
		)
	end
#end

users = User.all

#if ENV["list"]
	users.each do |user|
		List.create!(
	  		name:     Faker::Date.between(7.days.ago, Date.today),
	    	user_id:  user.id,
	    	private:  false
		)
	end
#end

lists = List.all

#if ENV["item"]
	lists.each do |list|
		6.times do
			Item.create!(
	  			name:     Faker::Simpsons.location,
	    		list_id:  list.id
			)
		end
	end
#end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
