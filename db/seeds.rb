require 'faker'

#Topics Creation
topics = []
15.times do topics << Topic.create(
    name: Faker::Lorem.words(rand(1..10)).join(" "),
    description: Faker::Lorem.paragraph(rand(1..4))
  )
end

#User Creation

u = User.new(
  name: 'Admin User',
  email: 'jason.carter.martin@gmail.com', 
  password: '1337h4x0r', 
  password_confirmation: '1337h4x0r')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')

u = User.new(
  name: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

#Random User Creation
rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  u.skip_confirmation!
  u.save

  #Posts Creation
  rand(5..12).times do
    topic = topics.first
    p = u.posts.create(
      topic: topic,
      title: Faker::Lorem.words(rand(1..10)).join(" "),
      body: Faker::Lorem.paragraphs(rand(1..4)).join("\n")
      )
    p.update_attribute(:created_at, Time.now - rand(600..31536000))
    p.update_rank

    topics.rotate!

    #Comments Creation
    rand(3..7).times do
        #c = u.comments.build(
        #  body: Faker::Lorem.paragraphs(rand(1..2)).join("\n")
        #  ) 

        c = p.comments.new(  
          body: Faker::Lorem.paragraphs(rand(1..2)).join("\n")
        )
        
        #c.user = u

        ## Have to do it this way, when I try either of the above options it either has a nil post_id, or nil user_id
        c.user = User.first(:order => "RANDOM()") # Sets the Comment User to Random
        c.save # Saves the comment
    end
  end
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"