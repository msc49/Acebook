module Helpers
  def sign_up(username:, email:, password:, confirm_password: password)
    # sign_up_button = "/html/body/button[1]/a"
    sign_up_username = '//*[@id="user_username"]' 
    sign_up_email = '//*[@id="user_email"]'
    sign_up_password = '//*[@id="user_password"]'
    sign_up_password_confirmation = '//*[@id="user_password_confirmation"]'
    sign_up_button_confirmation = '//*[@id="new_user"]/div[5]/input'

    visit "/users/sign_up"
    find(:xpath, sign_up_username).set(username)
    find(:xpath, sign_up_email).set(email)
    find(:xpath, sign_up_password).set(password)
    find(:xpath, sign_up_password_confirmation).set(confirm_password)
    find(:xpath, sign_up_button_confirmation).click
  end

  def login(email:, password:)
    login_button = '/html/body/div/form/div[4]/input'
    login_email = '//*[@id="user_email"]'
    login_password = '//*[@id="user_password"]'
    login_button_confirmation = '//*[@id="new_user"]/div[4]/input'

    visit "/"
    find(:xpath, login_button).click
    find(:xpath, login_email).set(email)
    find(:xpath, login_password).set(password)
    find(:xpath, login_button_confirmation).click
  end
  
  def sign_up_and_post(username:, email:, password:, post_content: )
    navbar_acebook_link = "/html/body/nav[1]/strong/a"
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    comment_content = '//*[@id="content"]'
    create_comment_btn = '//*[@id="create_comment"]'

    sign_up(username: username, email: email, password: password)
    find(:xpath, navbar_acebook_link).click
    find(:xpath, message_content).set(post_content)
    find(:xpath, create_post_btn).click
  end 

  def sign_up_x_times(times)
    log_out_button = '/html/body/nav/div[3]/ul/li[3]/a/form/input[2]' 
    
    for i in 1..times
      username_template = "username#{i}"
      email_template = "username#{i}@test.com"
      sign_up(username: username_template, email: email_template, password: '123456')
      find(:xpath, log_out_button).click
    end
  end
  
  def post_x_times(times)
    message_content = '//*[@id="post_message"]'
    create_post_btn = '//*[@id="submit"]'
    for i in 1..times
    find(:xpath, message_content).set("post#{i}")
    find(:xpath, create_post_btn).click
    end 
  end
end

