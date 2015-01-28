class CommentsController < ApplicationController
  before_action :find_discussion

  def create
    @project = Project.find @discussion.project_id
		@comment = @discussion.comments.new comment_params
    if @comment.save
      redirect_to @project, notice: "Comment created successfully"
    else
      render "projects/show/"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @project, notice: "Comment deleted successfully"
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_discussion
    @discussion = Discussion.find params[:discussion_id] 
  end

end
