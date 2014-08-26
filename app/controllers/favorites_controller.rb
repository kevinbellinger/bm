class FavoritesController < ApplicationController

def new
end

def show
end

  def create
   @bookmarks = Bookmark.all
    @user = current_user
    @bookmark = Bookmark.find(params[:bookmark_id])
    @favorite = current_user.favorites.build(bookmark: @bookmark, user: current_user)

      if favorite.save
        flash[:notice] = "Liked Bookmark"
        redirect_to [@bookmark]
      else
        flash[:error] = "Unable to like"
        redirect_to [@bookmark]
      end
  end

  def destroy
    # authorize favorite
    @bookmark = Bookmark.find(params[:bookmark_id])
    favorite = current_user.favorites.find(params[:id])

      if favorite.destroy
        flash[:notice] = "Removed like."
        redirect_to [@bookmark]
      else
        flash[:error] = "Unable to remove like. Please try again."
        redirect_to [@bookmark]
      end
  end
end