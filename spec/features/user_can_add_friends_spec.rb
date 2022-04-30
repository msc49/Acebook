require 'rails_helper'

RSpec.feature "Friends page features", type: :feature do

  # scenario "user can add friend " do
    
  #   # xpath did not work log_out_button = '//*[@id="navbarNavDropdown"]/ul/li[3]/form/input[2]'

  #   log_out_button = '/html/body/nav/div/ul/li[4]/form/input[2]'
  #   add_friend_button = '/html/body/div/ul/li[2]/a'    

  #   sign_up(username: "user1", email: "user1@test.com", password: "test123")
  #   find(:xpath, log_out_button).click
  #   sign_up(username: "user2", email: "user2@test.com", password: "test123")
  #   visit "/users"
  #   expect(page).to have_content "user1"
  #   expect(page).to have_content "Add Friend"
  #   find(:xpath,  add_friend_button).click
  #   expect(page).to have_content "Added friend"
  # end 
 
  scenario "user can not add themselves" do 
    username_element = "/html/body/div/ul[1]/li[1]"
    sign_up(username: "user1", email: "user1@test.com", password: "test123")
    visit "/users"
    # expect(page).to_not have_h "<li "
   expect(page.all(username_element).count).to eq(0)
  end 

end