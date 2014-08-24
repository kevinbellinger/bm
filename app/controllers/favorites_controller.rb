class FavoritesController < ApplicationController

  def create
    @bookmark = @bookmark.find(params[:bookmark_id])
    favorite = current_user.favorites.build(bookmark: @bookmark)

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
    @bookmark = @bookmark.find(params[:bookmark_id])
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