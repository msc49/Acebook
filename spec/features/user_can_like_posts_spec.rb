
require 'rails_helper'

RSpec.feature 'Likes feature: ', type: :feature do
  navbar_acebook_link = "/html/body/nav[1]/strong/a"
  create_post_input = '//*[@id="post_message"]'
  create_post_button = '//*[@id="submit"]'
  
  before :each do
    visit '/'
  end

  scenario 'users can like post' do 
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
    find(:xpath, navbar_acebook_link).click
    find(:xpath, create_post_input).set('this should work')
    find(:xpath, create_post_button).click
    expect(page).to have_content('this should work')

    click_link "Like"
    expect(page).to have_content('1 Like')
  end

  scenario 'users can only like the post once' do
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
    find(:xpath, navbar_acebook_link).click
    find(:xpath, create_post_input).set('this should work')
    find(:xpath, create_post_button).click
    
    click_link "Like"
    expect(page).to have_link("Unlike")
    expect(page).not_to have_link("Like")

  end

  scenario 'users can unlike the post' do
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
    find(:xpath, navbar_acebook_link).click
    find(:xpath, create_post_input).set('this should work')
    find(:xpath, create_post_button).click
  
    click_link "Like"
    click_link "Unlike"
    expect(page).to have_link("Like")
    expect(page).not_to have_link("Unlike")

  end

end