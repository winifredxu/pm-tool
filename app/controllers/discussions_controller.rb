class DiscussionsController < ApplicationController
  before_action :find_project

  def create
   @discussion = @project.discussions.new discussion_params
    if @discussion.save
      redirect_to @project, notice: "Discussion created successfully"
    else
      render "projects/show/"
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
