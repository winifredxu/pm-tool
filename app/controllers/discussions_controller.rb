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
    @discussion = Discussion.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:id]
    @project = Project.friendly.find @discussion.project_id
    if @discussion.update discussion_params
      redirect_to project_path(@discussion.project_id)
      flash[:success] = "Discussion was successfully edited."
    else
      render :edit
    end
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    flash[:success] = "Discussion was successfully deleted."

    respond_to do |format|
      format.html { redirect_to @project }
      format.js   { render }
    end

  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :description, :due_date)
  end

  def find_project
    @project = Project.friendly.find params[:project_id]
  end

end
