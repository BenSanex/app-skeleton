require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all

users = 20.times.map do
  User.create!( :display_name => Faker::Name.name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

questions = 20.times.map do
  Question.create!( :title => Faker::Lorem.sentence,
                    :body => Faker::Lorem.paragraph(10),
                    author: users.sample)
end

tags = []
25.times do |i|
  tags << Tag.create(name: Faker::Hipster.word)
end

Question.all.each do |question|
  4.times do |i|
    TagQuestion.create(tag: tags.sample, question: question)
  end
end

users.each do |user|
  user_questions = questions.sample(rand(2..4))
  user_questions.each do |question|
    Answer.create!(:body => Faker::Hacker.say_something_smart,
                   answerer: user,
                   question: question)
  end
end

users.each do |user|
  questions.each do |question|
    Vote.create!(
      voter: user,
      votable: question,
      value: [-1, 1].sample)
  end
  Answer.all.each do |answer|
    Vote.create!(
      voter: user,
      votable: answer,
      value: [-1, 1].sample)
  end
end

