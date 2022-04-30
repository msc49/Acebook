require 'rails_helper'

RSpec.feature "Submit posts", type: :feature do
  scenario "Can submit posts and view them" do
    navbar_acebook_link = "/html/body/nav[1]/strong/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
       
    sign_up(username: "test_username", email: "test@test.com", password: "test123")


    find(:xpath, navbar_acebook_link).click
    expect(page).to have_current_path("/posts")

    find(:xpath, message_content).set("a post")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("a post")
  
  end
end
