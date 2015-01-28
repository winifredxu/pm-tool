class TasksController < ApplicationController
  before_action :find_project

  def create
    @task = @project.tasks.new task_params
    if @task.save
      redirect_to @project, notice: "Task created successfully"
    else
      render "projects/show/"
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to @project, notice: "Task deleted successfully"
  end


  private

  def find_project
    @project = Project.find params[:project_id]
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end
end
