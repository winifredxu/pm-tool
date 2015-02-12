class DiscussionsController < ApplicationController
  before_action :find_project
  before_action :authenticate_user!

  def create
    @discussion = @project.discussions.new discussion_params
    @discussion.user = current_user
    respond_to do |format|
      if @discussion.save
        format.html { redirect to @project }
        format.js { render }
      else
        render.html { redirect_to "projects/show/" }
        render.js { render }
      end
    end
  end

  def edit
    @discussion = Discussion.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:id]
    @project = Project.friendly.find @discussion.project_id
    if @discussion.update discussion_params
      flash[:success] = "Discussion was successfully edited."
      redirect_to project_path(@discussion.project_id)

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
