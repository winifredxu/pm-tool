class TasksController < ApplicationController
  before_action :find_project
  before_action :authenticate_user!

  def create
    @task = @project.tasks.new task_params
    if @task.save
      redirect_to @project, notice: "Task created successfully"
    else
      render "projects/show/"
    end
  end

  def destroy

    @project = Project.find @task.project_id
    @task = Task.find params[:id]
    @task.destroy
    redirect_to @project, notice: "Task deleted successfully"
  end

  def edit
  end

  def update
    if @task.update task_params
      redirect_to project_path
      flash[:success] = "Task was successfully edited."
    else
      render :edit
    end
  end


  private

  def find_project
    @project = Project.find params[:project_id]
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :status)
  end
end
