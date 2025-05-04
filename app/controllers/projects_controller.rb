class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:tasks).all.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.active.order(created_at: :desc)

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to projects_path, notice: "Project created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to projects_path, notice: "Project was deleted." }
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end
