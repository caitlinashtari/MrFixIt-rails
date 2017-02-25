require 'rails_helper'

describe 'sign up/in process for users and workers' do
  it 'allows users to sign up' do
    visit new_user_registration_path
    fill_in "Email", :with => "new@test.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button 'Sign up'
    expect(page).to have_content("new@test.com")
  end

  it 'allows users to sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", :with => "test@test.com"
    fill_in "Password", :with => "123456"
    click_button "Log in"
    expect(page).to have_content("test@test.com")
  end

  it 'allows workers to sign up' do
    visit new_worker_registration_path
    fill_in "Email", :with => "new@test.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button 'Sign up'
    expect(page).to have_content("new@test.com")
  end

  it 'allows workers to sign in' do
    worker = FactoryGirl.create(:worker)
    visit new_worker_session_path
    fill_in "Email", :with => "test@test.com"
    fill_in "Password", :with => "123456"
    click_button "Log in"
    expect(page).to have_content("test@test.com")
  end
end
