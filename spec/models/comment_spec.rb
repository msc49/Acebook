require 'rails_helper'


RSpec.describe Comment, type: :model do
 

  it "allows a user to submit a comment" do
    user = User.new(username: 'test_username',
      email: "test@test.com",
      password: "123456",)
    post = Post.new(user: user, message: "This is a post")
    post.save

    comment = Comment.new(user: user, content: "This is my first comment", post_id: post.id)
    comment.save
    expect(comment).to be_valid
  end 

  it "prevents a user from submitting an empty comment on a post" do
    user = User.new(username: 'test_username',
      email: "test@test.com",
      password: "123456",)
    post = Post.new(user: user, message: "This is a post")
    post.save
    # Above might need amending
    comment = Comment.new(user: user, content: "", post_id: post.id)
    expect(comment).to_not be_valid
  end

end


