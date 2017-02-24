class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if @job.update(job_params)
        respond_to do |format|
          format.html {redirect_to worker_path(current_worker)}
          format.js
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

  def destroy
    @job = Job.destroy(params[:id])
    respond_to do |format|
      format.html {redirect_to worker_path(current_worker)}
      format.js
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description, :in_progress, :completed, :pending)
  end

end
