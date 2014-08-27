class FavoritesController < ApplicationController

def new
    @bookmark = Bookmark.find(params[:bookmark_id])

end

def show
   @bookmarks = Bookmark.all

end

  def create
  
    @user = current_user
    @bookmark = Bookmark.find(params[:bookmark_id])
    @favorite = @bookmark.favorites.build(user_id: @user, bookmark_id: @bookmark) 

      if @favorite.save
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
    @favorite = current_user.favorites.find(params[:id])

      if favorite.destroy
        flash[:notice] = "Removed like."
        redirect_to [@bookmark]
      else
        flash[:error] = "Unable to remove like. Please try again."
        redirect_to [@bookmark]
      end
  end

  private
  def favorite_params
    params.require(:bookmark_id, :user_id)
  end



end