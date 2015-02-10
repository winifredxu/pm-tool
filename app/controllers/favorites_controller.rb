class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    project       = Project.friendly.find params[:project_id]
    favorite      = project.favorites.new
    favorite.user = current_user

    if current_user
      if favorite.save
        redirect_to project, notice: "Project is now a favorite <3"
      else
        redirect_to project, alert: "Unable to save favorite"
      end
    else
      redirect_to new_user_session_path, alert: "Please sign in to favorite"
    end
  end

  def destroy
    project     = Project.friendly.find params[:project_id]
    favorite    = project.favorites.find params[:id]
    if favorite.destroy
      redirect_to project, notice: "UnLiked!"
    else
      redirect_to project, alert: "Can't UnLike!"
    end
  end

  def show
    @favorites = find_favorites
  end

  private

  def find_favorites
    current_user.favorites.map { |fav| project = Project.find fav.project_id; project.title }
  end

end
