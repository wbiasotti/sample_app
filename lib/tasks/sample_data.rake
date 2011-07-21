#require 'faker'

namespace :db do
  desc "Fill database with sample data"
 
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User1",
  		 	 :email => "example@railstutorial.org",
			 :password => "foobar",
  			 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
#      name = Faker::Name.name
      name = "Example User#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
		   :email => email,
		   :password => password,
		   :password_confirmation => password)
    end

    User.all(:limit => 6).each do |user|
      50.times do
#     	user.microposts.create!(:content => Faker::Lorem.sentence(5))
	user.microposts.create!(:content => "This is sentance #{n+1}")
      end
    end
  end
end

