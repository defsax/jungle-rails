require 'rails_helper'

RSpec.feature "When a user logs in", type: :feature, js: true do

  # SETUP
  before :each do
    user = User.create!(
      first_name: "Per",
      last_name: "Per",
      email: "12345@12345.com",
      password: "12345",
      password_confirmation: "12345"
    )
  end

  scenario "They are taken to the home page" do
    
    #ACT
    visit '/login'
    
    fill_in 'email', with: '12345@12345.com'
    fill_in 'password', with: '12345'
    
    click_on 'Submit'

    #DEBUG
    save_screenshot('login-test-form.png')

    #VERIFY
    expect(page).to have_text('Per')
  end
end
