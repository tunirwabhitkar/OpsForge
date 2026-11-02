module Ats
  class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]

    def index
      @jobs = current_organization.jobs.order(created_at: :desc)
    end

    def show
    end

    def new
      @job = current_organization.jobs.new
    end

    def create
      @job = current_organization.jobs.new(job_params)
      if @job.save
        redirect_to ats_job_path(@job), notice: "Job created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @job.update(job_params)
        redirect_to ats_job_path(@job), notice: "Job updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @job.destroy
      redirect_to ats_jobs_path, notice: "Job deleted successfully."
    end

    private

    def set_job
      @job = current_organization.jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :department, :location, :status, :description)
    end
  end
end
