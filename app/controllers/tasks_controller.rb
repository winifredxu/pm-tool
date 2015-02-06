class TasksController < ApplicationController
  before_action :find_project,
   only: [:create, :show, :destroy, :search, :edit]
  before_action :authenticate_user!

  def create
    @task = @project.tasks.new task_params
    if @task.save
      redirect_to @project, notice: "Task created successfully"
    else
      redirect_to @project
      #render "projects/show.html.erb"
    end
  end

  # def create
  #   @task = @project.tasks.new task_params
  #   #respond_to do |format|
  #   if @task.save
  #     redirect_to @project
  #     #format.html { redirect_to @project }
  #     #format.js { render }
  #   else
  #     render "projects/show/"
    
  #   #   respond_to do |format|
  #   #     format.html { redirect_to @project, notice: "Task created successfully" }
  #   #     format.js { render }
  #   #   end 
  #   # else
  #   #   format.js { render }


  #   end



  def destroy
    task = Task.find params[:id]
    @project = Project.friendly.find task.project_id
    
    task.destroy
    flash[:success] = "Task was successfully deleted."
    
    respond_to do |format|
      format.html { redirect_to @project }
      format.js { render }
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    @project = Project.friendly.find @task.project_id
    if @task.update task_params
      redirect_to project_path(@task.project_id)
      flash[:success] = "Task was successfully edited."
    else
      render :edit
    end
  end


  private

  def find_project
    @project = Project.friendly.find params[:project_id]
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :status)
  end
end
