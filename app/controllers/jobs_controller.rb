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
      flash[:alert] = "Oops!"
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if params[:completed] && @job.update(completed: true)
        respond_to do |format|
          format.html {redirect_to worker_path(current_worker)}
          format.js
        end
      elsif params[:in_progress] && @job.update(in_progress: true)
        respond_to do |format|
          format.html {redirect_to worker_path(current_worker)}
          format.js
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
