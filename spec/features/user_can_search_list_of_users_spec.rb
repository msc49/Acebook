require 'rails_helper'

RSpec.feature 'list of users page', type: :feature do
  list_of_users = '//*[@id="navbar"]/ul/li[1]/a'
  list_of_users_next_page = '/html/body/div/div/div[3]/button/nav/ul/li[4]/a'
  list_of_users_prev_page = '/html/body/div/div/div[3]/button/nav/ul/li[1]/a'
  list_of_users_page_1 = '/html/body/div/div/div[3]/button/nav/ul/li[2]/a'
  list_of_users_page_2 = '/html/body/div/div/div[3]/button/nav/ul/li[3]/a'

  scenario 'Can navigate to list of users' do
    sign_up(username: 'test_username', email: 'test@test.com', password: '123456')
    find(:xpath, list_of_users).click
    expect(page).to have_current_path("/users")
  end


  scenario 'Can display all users except user that is logged in' do
    sign_up_x_times(3)
    login(email: "username1@test.com", password: "123456")

    find(:xpath, list_of_users).click
    expect(page).to have_current_path("/users")
    expect(page).to have_content("username2")
    expect(page).to have_content("username3")
  end

  scenario 'Can navigate through list of users using next page' do
    sign_up_x_times(6)
    login(email: "username1@test.com", password: "123456")

    find(:xpath, list_of_users).click
    expect(page).to have_content("username5")
    expect(page).not_to have_content("username6")

    find(:xpath, list_of_users_next_page).click
    expect(page).not_to have_content("username5")
    expect(page).to have_content("username6")
    
  end

  scenario 'Can navigate through list of users using prev page' do
    sign_up_x_times(8)
    login(email: "username1@test.com", password: "123456")

    find(:xpath, list_of_users).click
    expect(page).to have_content("username5")
    expect(page).not_to have_content("username2")

    find(:xpath, list_of_users_next_page).click
    expect(page).to have_content("username2")

    find(:xpath, list_of_users_prev_page).click
    expect(page).to have_content("username5")
    expect(page).not_to have_content("username2")
   
  end

  scenario 'Can navigate through list of users using numbered page buttons' do
    sign_up_x_times(6)
    login(email: "username1@test.com", password: "123456")

    find(:xpath, list_of_users).click
    expect(page).to have_content("username5")
    expect(page).not_to have_content("username6")

    find(:xpath, list_of_users_page_2).click
    expect(page).to have_content("username6")

    find(:xpath, list_of_users_page_1).click
    expect(page).to have_content("username5")
    expect(page).not_to have_content("username6")
   
  end
end