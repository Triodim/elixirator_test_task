class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    @task.active = true

    if @task.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: "Task created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path, notice: "Task deleted." }
    end
  end

  def edit
    @task = Task.find(params[:id])
    @project = @task.project
  end

  def update
    @task = Task.find(params[:id])
    @project = @task.project

    if @task.update(task_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: "Task updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :parent_id)
  end
end
