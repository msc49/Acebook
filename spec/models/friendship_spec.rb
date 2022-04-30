require 'rails_helper'

RSpec.describe Friendship, type: :model do

  it 'creates a friendship' do
  user1 = User.new(id: 1, username: 'user1',
    email: "test@test.com",
    password: "123456",)

  user2 = User.new(id:2, username: 'user2',
      email: "test@test.com",
      password: "123456",)

  friends = Friendship.new(id:1, user_id: user1.id, friend_id: user2.id) 

  expect(friends.user_id).to eq(user1.id)
  expect(friends.friend_id).to eq(user2.id)
  end
end
