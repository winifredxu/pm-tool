class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    project       = Project.friendly.find params[:project_id]
    favorite      = project.favorites.new
    favorite.user = current_user

    if current_user
      if favorite.save
        flash[:success] = "Favorite added!"
        redirect_to project
      else
        flash[:alert] = "Favorite could not be saved."
        redirect_to project
      end
    else
      flash[:alert] = "Please sign in to favorite."
      redirect_to new_user_session_path, 
    end
  end

  def destroy
    project     = Project.friendly.find params[:project_id]
    favorite    = project.favorites.find params[:id]
    if favorite.destroy
      flash[:success] = "Favorite removed!"
      redirect_to project
    else
      flash[:alert] = "Favorite could not be removed."
      redirect_to project
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
