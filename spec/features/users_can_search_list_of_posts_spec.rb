require 'rails_helper'

RSpec.feature 'list of posts page', type: :feature do
  navbar_acebook_link = "/html/body/nav/strong/a" 
  list_of_posts_next_page = '/html/body/div/div/div[3]/button/nav/ul/li[4]/a' 
  list_of_posts_previous_page = '/html/body/div/div/div[3]/button/nav/ul/li[1]/a'
  list_of_posts_page_2 = '/html/body/div/div/div[3]/button/nav/ul/li[3]/a'
  list_of_posts_page_1 = '/html/body/div/div/div[3]/button/nav/ul/li[2]/a'

  scenario 'Can navigate through list of posts using next page button' do
    sign_up(username: "username1", email: "username1@test.com", password: "123456")
    find(:xpath, navbar_acebook_link).click
    post_x_times(12)

    expect(page).to have_content("post11")
    expect(page).not_to have_content("post2")

    find(:xpath, list_of_posts_next_page).click

    expect(page).not_to have_content("post10")
    expect(page).to have_content("post2")
    expect(page).to have_content("post1")
  end

  scenario 'Can navigate through list of posts using previous page button' do
    sign_up(username: "username1", email: "username1@test.com", password: "123456")
    find(:xpath, navbar_acebook_link).click
    post_x_times(12)

    expect(page).to have_content("post11")
    expect(page).not_to have_content("post2")

    find(:xpath, list_of_posts_next_page).click

    expect(page).not_to have_content("post10")
    expect(page).to have_content("post2")
    expect(page).to have_content("post1")

    find(:xpath, list_of_posts_previous_page).click

    expect(page).to have_content("post11")
    expect(page).not_to have_content("post2")
  end

  scenario 'Can navigate through list of posts using numbered page buttons' do
    sign_up(username: "username1", email: "username1@test.com", password: "123456")
    find(:xpath, navbar_acebook_link).click
    post_x_times(12)

    expect(page).to have_content("post11")
    expect(page).not_to have_content("post2")

    find(:xpath, list_of_posts_page_2).click

    expect(page).not_to have_content("post10")
    expect(page).to have_content("post2")
    expect(page).to have_content("post1")

    find(:xpath, list_of_posts_page_1).click
    expect(page).to have_content("post11")
    expect(page).not_to have_content("post2")
  end
end
