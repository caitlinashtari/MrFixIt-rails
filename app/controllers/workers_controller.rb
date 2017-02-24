class WorkersController < ApplicationController
  def show
    @worker = current_worker
    @pending = current_worker.jobs.where(pending: true)
    @completed = current_worker.jobs.where(completed: true)
    @in_progress = current_worker.jobs.where(in_progress: true)
  end

  def new
    # current_worker refers to a worker account currently logged in. current_user refers to a user account currently logged in.
    if current_worker
      redirect_to worker_path(current_worker)
      flash[:notice] = "You're already logged into a worker account!"
    elsif current_user
      # need to make sure users signing up to be workers are signed out of their user account first. -Mr. Fix-It
    sign_out :user
    redirect_to new_worker_registration_path
    else
      redirect_to new_worker_registration_path
    end
  end

  def claim_job
    @job = Job.find(params[:worker_id])
    if current_worker
      if @job.update(pending: true, worker_id: current_worker.id)
        respond_to do |format|
          format.html {redirect_to worker_path(current_worker)}
          format.js { 'claim_job.js.erb' }
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to job_path(@job)
    end
  end


end
