# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.new(name: 'carlos', email: 'carlosj@gmail.com', password: 'ecerrecXX')
    assert user.valid?
    puts "User is valid"
  end

  test 'invalid without name' do
    user = User.new(name: ' ', email: 'carlosj@gmail.com', password: 'ecerrecXX')
    assert_not user.valid?, 'The name user is a empty string'
    puts "Name User is Ok..."
  end

  test 'invalid without email' do
    user = User.new(name: 'Carlos Arrieta', email: ' ', password: 'ecerrecXX')
    assert_not user.valid?, 'The email user is a empty string'
    puts "Email User is Ok..."
  end

  test "should not create user with duplicate email" do
    User.create(email: "test@example.com", password: "password", name: "Carlos")
    user2 = User.new(email: "test@example.com", password: "password", name: "Carlos")
    assert_not user2.valid?, "The emails are same"
    puts "Email Unique User is Ok..."
  end

end
