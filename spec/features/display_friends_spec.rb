require 'rails_helper'

RSpec.feature "Display friends", type: :feature do
  log_out_button = '/html/body/nav/div/ul/li[4]/form/input[2]'
  add_friend_button = '/html/body/div/ul/li[2]/a'
  remove_friend_button = '/html/body/div/div[2]/ul/li/a'

  # before do
  #   sign_up(username: "user1", email: "user1@test.com", password: "test123")
  #   find(:xpath, log_out_button).click
  #   sign_up(username: "user2", email: "user2@test.com", password: "test123")
  #   visit("/users")
  #   find(:xpath, add_friend_button).click
  #   visit("/posts")
  # end

  # scenario "user can see all of their friends" do
  #   expect(page).to have_content("user1")
  #   expect(page).to have_content("remove")
  # end

  # scenario "user can remove a friend" do
  #   find(:xpath, remove_friend_button).click
  #   expect(page).to_not have_content("user1")
  #   expect(page).to have_content("Removed friend.")
  # end
end