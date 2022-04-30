require 'rails_helper'

RSpec.feature "Comment-related features: ", type: :feature do
  scenario "Can comment on posts and view changes" do
    
    navbar_acebook_link = "/html/body/nav[1]/strong/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    comment_content = '//*[@id="content"]'
    create_comment_btn = '//*[@id="create_comment"]'

    sign_up(username: "test_username", email: "test@test.com", password: "test123")

    find(:xpath, navbar_acebook_link).click
    expect(page).to have_current_path("/posts")

    find(:xpath, message_content).set("a post")
    find(:xpath, create_post_btn).click
    expect(page).to have_content("a post")
  
    find(:xpath, comment_content).set("Fantastic")
    find(:xpath, create_comment_btn).click
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Fantastic")

  end

  pending "Can delete own comments on any post" 

  pending "Can delete other's comments on own post"

end
