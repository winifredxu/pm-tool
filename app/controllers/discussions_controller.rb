class DiscussionsController < ApplicationController
  before_action :find_project
  before_action :authenticate_user!

  def create
   @discussion = @project.discussions.new discussion_params
    if @discussion.save
      redirect_to @project, notice: "Discussion created successfully"
    else
      render "projects/show/"
    end
  end

  def edit
  end

  def update
    if @discussion.update discussion_params
      redirect_to projects_path
      flash[:success] = "Request was successfully edited."
    else
      render :edit
    end
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to @project, notice: "Discussion deleted successfully"
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :description, :due_date)
  end

  def find_project
    @project = Project.find params[:project_id]
  end

end
