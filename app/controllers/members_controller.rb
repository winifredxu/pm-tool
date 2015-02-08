class MembersController < ApplicationController

	  before_action :authenticate_user!

  def create
    project  = Project.friendly.find params[:project_id]
    member   = project.members.new
    like.user = current_user
    if like.save
      redirect_to project, notice: "Member added!"
    else
      redirect_to project, alert: "You cannot do this."
    end
  end

  def destroy
    project = Project.friendly.find params[:project_id]
    member    = project.members.find params[:id]
    if member.destroy
      redirect_to project, notice: "Removed member"
    else
      redirect_to project, alert: "You cannot do this."
    end
  end
end
