# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'


statuses = Task.statuses.keys

puts 'Creating 100 projects with tasks...'

100.times do
  project = Project.create!(
    name:        Faker::Company.name,
    description: Faker::Company.catch_phrase,
    status:      statuses.sample
  )

  rand(25..40).times do
    expired = [true, false].sample
    expiration_date = expired ? Faker::Date.backward(days: 365) : Faker::Date.forward(days: 180)

    Task.create!(
      project:     project,
      title:       Faker::Job.title,
      description: Faker::Lorem.sentence(word_count: 10),
      status:      statuses.sample,
      expired_at:  expiration_date,
      active:      !expired
    )
  end
end
puts 'Done!'