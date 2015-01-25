class TasksController < ApplicationController

  def create
    @project = Project.find params[:project_id]
    @task = @project.tasks.new task_params
    if @task.save
      redirect_to @project, notice: "Task created successfully"
    else
      render "projects/show/"
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    @task.destroy
    redirect_to @project, notice: "Task deleted successfully"

  end


  private

  def task_params
    params.require(:task).permit(:title, :due_date)
  end
end
