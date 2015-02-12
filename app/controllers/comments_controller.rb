class CommentsController < ApplicationController
  before_action :find_discussion
  before_action :authenticate_user!

  def create
    @project = Project.friendly.find @discussion.project_id
    @comment = @discussion.comments.new comment_params
    respond_to do |format|
      if @comment.save
        if @discussion.user != current_user
          CommentsMailer.notify_discussion_owner(@discussion).deliver_later
        end
        format.html { redirect_to @project }
        format.js { render }
      else
        flash[:alert] = "Comment body cannot be empty"
        redirect_to @project
      end
    end
  end

  def destroy
    @project = Project.friendly.find @discussion.project_id
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice:"Comment was successfully edited." }
      format.js { render }
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    @discussion = Discussion.find @comment.discussion_id
    if @comment.update comment_params
      flash[:success] = "Comment was successfully edited."
      respond_to do |format|
        format.html { redirect_to project_path(@discussion.project_id) }
        format.js { render }
      end
    else
      render :edit
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_discussion
    @discussion = Discussion.find params[:discussion_id]
  end

end
