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
    @project.user = current_user
    if @project.save
      flash[:success] = "Project was successfully created."
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project successfully deleted."

    respond_to do |format|
      format.html { redirect_to projects_path, notice: "Project deleted"}
      format.js   { render }
    end
  end



  def edit
    #redirect_to root_path, alert: "access denied" unless can? :edit, @project
  end

  def update
    # redirect_to root_path, alert: "access denied" unless can? :edit, @project
    if @project.update project_params
       flash[:success] = "Project was successfully edited."
      redirect_to projects_path
     
    else
      render :edit
    end
  end

  def show
    @task = Task.new
    @discussion = Discussion.new
    @comment = Comment.new
    @members = find_member_names
    @taggings = find_tags
  end


  def search
    @projects = Project.search params[:search]
  end



  private

  def project_params
    params.require(:project).permit(:title, :description,
                                    :due_date, :search, {project_member_ids: []}, {tag_ids: []})
  end

  def find_project
    @project = Project.friendly.find params[:id]
  end

  def restrict_access
    unless can? :manage, @project
      redirect_to root_path, alert: "access denied"
    end
  end

  def find_member_names
    @project.members.map { |member| user = User.find member.user_id; user.first_name + ' ' + user.last_name }
  end

  def find_tags
    @project.taggings.map { |t| tag = Tag.find t.tag_id; tag.title }
  end



end
