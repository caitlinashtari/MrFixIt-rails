require 'rails_helper'

describe 'the claim job path' do
  it 'will allow a worker to claim a job', js: true do
    job = FactoryGirl.create(:job)
    worker = FactoryGirl.create(:worker)
    login_as(worker)
    visit job_path(job)
    click_link 'Claim Job'
    expect(page).to have_content('has been claimed!')
  end

  it 'will not allow a user to claim a job', js: true do
    job = FactoryGirl.create(:job)
    user = FactoryGirl.create(:user)
    login_as(user)
    visit job_path(job)
    click_link 'Claim Job'
    expect(page).to have_content('You must have a worker account to claim a job. Register for one using the link in the navbar above.')
  end
end
