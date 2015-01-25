class DiscussionsController < ApplicationController
  before_action :find_task

  def create
    @discussion = @task.discussions.new discussion_params
    if @discussion.save
      redirect_to project_path(@task.project), notice: "Discussion created successfully"
    else
      render "projects/show/"
    end

  end


  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to project_path(@task.project), notice: "Task deleted successfully"
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :description, :due_date)
  end
  def find_task
    @task = Task.find params[:task_id]
  end

end
