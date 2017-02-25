require 'rails_helper'

describe 'the new job path' do
  it 'will allow a user to add a job' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit new_job_path
    fill_in 'Title', :with => 'Wash the floors'
    fill_in 'Description', :with => 'Wash the floors'
    click_on 'Create Job'
    expect(page).to have_content('Wash the floors')
  end

  it 'will fail to post a job' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit new_job_path
    click_on 'Create Job'
    expect(page).to have_content('Oops!')
  end
end
