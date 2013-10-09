namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
# This just tells it that rake has access to the local Rails env
# which includes the models.
		admin = User.create!(name: "Example User",
												 email: "example@railstutorial.org",
								 				 password: "foobar",
								 				 password_confirmation: "foobar",
												 admin: true)
# We use create! so that it raises an exception for an invalid user
# instead of just returning false.
# Also setting admin here just sets our first user as an admin.

		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name,
									 email: email,
									 password: password,
									 password_confirmation: password)
		end

		50.times do |n|
			name = Faker::Name.name + "\'s Wine"
			varietal = "Grape-#{n+1}"
			country = "#{n+1}-land"
			place = Faker::Address.city
			vintage = "#{2000 + rand(10)}"
			price = "#{n+1}"
			description = Faker::Lorem.sentence(6)
			producer = Faker::Name.name + "Vineyards"
			category = "Spain"
			Wine.create!(name: name,
									 varietal: varietal,
									 country: country,
									 place: place,
									 vintage: vintage,
									 price: price,
									 description: description,
									 producer: producer,
									 category: category)
		end

		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.comments.create!(content: content) }
		end
	end
end