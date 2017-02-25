require 'rails_helper'

describe 'the worker dashboard path' do
  it 'will allow a worker to view all of their pending, in progress, completed jobs' do
    worker = FactoryGirl.create(:worker)
    job = FactoryGirl.create(:job, worker_id: 1, pending: true)
    login_as(worker)
    visit worker_path(worker)
    expect(page).to have_content(job.title)
  end

  it 'will allow a worker to mark a pending job as in progress', js: true do
    worker = FactoryGirl.create(:worker)
    job = FactoryGirl.create(:job, worker_id: 1, pending: true)
    login_as(worker)
    visit worker_path(worker)
    click_link "In Progress"
    expect(page).to have_content("In-Progress: Clean the database")
  end

  it 'will allow a worker to mark a job as completed', js: true do
    worker = FactoryGirl.create(:worker)
    job = FactoryGirl.create(:job, worker_id: 1, pending: true)
    login_as(worker)
    visit worker_path(worker)
    click_link "Completed"
    expect(page).to have_content("Completed: Clean the database")
  end
end
