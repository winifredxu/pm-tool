class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project,
    only: [:show, :edit, :update, :destroy, :search]
  # before_action :restrict_access,
  #   only: [:edit, :update, :destroy]


  def index
    if params[:search]
      @projects = Project.search(params[:search]).order('created_at DESC')
    else
      @projects = Project.all
    end
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
    #redirect_to root_path, alert: "access denied" unless can? :edit, @project
  end

  def update
   # redirect_to root_path, alert: "access denied" unless can? :edit, @project
    if @project.update project_params
      redirect_to projects_path
      flash[:success] = "Request was successfully edited."
    else
      render :edit
    end
  end

  def show 
    @task = Task.new
    @discussion = Discussion.new
    @comment = Comment.new
  end


  def search
   @projects = Project.search params[:search]
  end

  

  private

  def project_params
    params.require(:project).permit(:title,
                                    :description, :due_date, :search)
  end

  def find_project
    @project = Project.friendly.find params[:id]
  end

  def restrict_access
    unless can? :manage, @project
      redirect_to root_path, alert: "access denied" 
    end
  end


end
