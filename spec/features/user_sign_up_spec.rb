require 'rails_helper'

RSpec.feature 'Sign up page: ', type: :feature do
  log_out_button = '//*[@id="navbar"]/ul/li[3]/a/form/input[2]'

  before :each do
    visit '/'
  end

  scenario 'Can sign up' do
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
    expect(page).to have_content('You are signed in as test_username (test@test.com)')
    expect(page).not_to have_content 'Sign up'
  end

  scenario 'Cannot sign up if password is too short' do
    sign_up(username: "test_username", email: "test@test.com", password: "12345")
    expect(page).not_to have_content('You are signed in as test_username (test@test.com)')
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Password is too short (minimum is 6 characters)')
    expect(page).to have_content 'Sign up'
  end

  scenario 'Cannot sign up if email is invalid' do
    sign_up(username: "test_username", email: "adssadasdaasd", password: "test123")
    expect(page).not_to have_content('You are signed in as test_username (test@test.com)')
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Email is invalid')
  end

  scenario 'Cannot sign up if email is taken' do
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
    find(:xpath, log_out_button).click
    sign_up(username: "test_username2", email: "test@test.com", password: "test123")
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Email has already been taken')
  end

  scenario 'Cannot sign up if username is taken' do
    sign_up(username: "test_username", email: "test@test.com", password: "test123")
    find(:xpath, log_out_button).click
    sign_up(username: "test_username", email: "test2@test.com", password: "test123")
    expect(page).to have_content('Sign up 1 error prohibited this user from being saved: Username has already been taken')
  end

  scenario "Cannot sign up if passwords don't match" do
    sign_up(username: "test_username", email: "test@test.com", password: "test123", confirm_password: "test1234")
    expect(page).not_to have_content('You are signed in as test_username (test@test.com)')
    expect(page).to have_content("Sign up 1 error prohibited this user from being saved: Password confirmation doesn't match")
  end

  scenario "Cannot sign up if email is invalid and passwords don't match" do
    sign_up(username: "test_username", email: "test", password: "test123", confirm_password: "test1234")
    expect(page).not_to have_content('You are signed in as test_username (test@test.com)')
    expect(page).to have_content('Sign up 2 errors')
  end

  scenario 'Cannot sign up if email is invalid and passwords is too short' do
    sign_up(username: "test_username", email: "test", password: "123")
    expect(page).not_to have_content('You are signed in as test_username (test@test.com)')
    expect(page).to have_content('Sign up 2 errors')
  end
end
