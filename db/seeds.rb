require 'faker'

users = 50.times.map do
  User.create!( :display_name => Faker::Name.name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

users.each do |user|
  3.times do
    Question.create!( :title => Faker::Lorem.sentence,
                    :body => Faker::Lorem.paragraph(10),
                    author: user)
  end
end