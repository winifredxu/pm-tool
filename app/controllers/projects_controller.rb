class ProjectsController < ApplicationController

  before_action :find_project,
    only: [:show, :edit, :update, :destroy, :search]

  def index
    @projects = Project.all
    @tasks = Task.all
  end

  def new
    @project = Project.new
    render :new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to projects_path
      flash[:success] = "Project was successfully created."
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
    flash[:success] = "Project successfully deleted."
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to projects_path
      flash[:success] = "Request was successfully edited."
    else
      render :edit
    end
  end

  def show
    @task = Task.new
    @tasks = @project.tasks
    #@discussion = Discussion.new
    # #  @discussion = @task.discussions.new
    #   @discussions = @task.discussions.all
  end





  private

  def project_params
    params.require(:project).permit(:title,
                                    :description, :due_date)
  end

  def find_project
    @project = Project.find params[:id]
  end

end
