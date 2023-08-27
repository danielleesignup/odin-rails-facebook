# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seeds.rb

# Create users with associated profiles and set unique profile information

# Profile.destroy_all
# User.destroy_all


users_data = [
  {
    email: 'user1@example.com',
    password: 'password123',
    profile_attributes: {
      name: 'John Doe',
      bio: 'I am user number one',
      avatar: 'avatar1.jpg'
    }
  },
  {
    email: 'user2@example.com',
    password: 'password456',
    profile_attributes: {
      name: 'Jane Smith',
      bio: 'I am user number two',
      avatar: 'avatar2.jpg'
    }
  },
  # Add more user data as needed
]

# users_data.each do |user_data|
#   user = User.create!(email: user_data[:email], password: user_data[:password])
#   user.create_profile!(user_data[:profile_attributes])
# end

users_data.each do |user_data|
    user = User.create!(email: user_data[:email], password: user_data[:password])
  end
  
