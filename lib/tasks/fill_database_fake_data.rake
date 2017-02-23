require 'faker'

namespace :db do
  desc 'Fill the database by fake data'
  task :fill_fake_data do
    if Rails.env.development?
      MAX_USER = 10
      MAX_DAYS = 120

      users = []
      1.upto(MAX_USER).each do
        users << User.create(
          nickname: Faker::Name.name,
          email: Faker::Internet.email,
          password: '123123123')
      end

      1.upto(100).each do
        users[Random.new.rand(MAX_USER)].posts.create(
          title: Faker::Lorem.sentence,
          body: Faker::Lorem.paragraph,
          published_at: Time.now + (Random.new.rand(MAX_DAYS) - MAX_DAYS).days
        )

        users[Random.new.rand(MAX_USER)].comments.create(
          body: Faker::Lorem.paragraph,
          published_at: Time.now + (Random.new.rand(MAX_DAYS) - MAX_DAYS).days
        )
      end
    end
  end
end
