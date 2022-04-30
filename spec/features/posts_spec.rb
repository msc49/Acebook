require 'rails_helper'

RSpec.feature "Posting", type: :feature do
  post_content = '//*[@id="post_message"]'
  upload_image_button = '//*[@id="images"]'
  submit_post_button = '//*[@id="submit"]'


  before :each do
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
  end
  
  # scenario "Can submit posts and view them" do
  #   visit "/posts"
  #   find(:xpath, '//*[@id="post_message"]').set("Hello, world!")
  #   find(:xpath, '//*[@id="submit-button"]/input').click
  #   expect(page).to have_content("Hello, world!")
  # end

  scenario "Can submit picture and text" do
    visit "/posts"
    find(:xpath, post_content).set("Test")
    find(:xpath, upload_image_button).set("lib/assets/Scooby-Doo_test_picture.png")
    find(:xpath, submit_post_button).click
    expect(page).to have_content("Test")
    expect(page).to have_css("img[src*='Scooby-Doo_test_picture.png']")  
  end

  scenario "Can submit just a picture as a posts" do
    visit "/posts"
    find(:xpath, upload_image_button).set("lib/assets/ShaggyRogers_test_picture.png")
    find(:xpath, submit_post_button).click
    expect(page).to have_css("img[src*='ShaggyRogers_test_picture.png']")  
  end

  scenario "Doesn't let you post without either message or picture" do
    visit "/posts"
    find(:xpath, submit_post_button).click
    expect(page).to_not have_button("Post needs a message or an image") 
  end 
end
