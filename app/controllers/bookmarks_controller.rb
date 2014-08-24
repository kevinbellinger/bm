class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @comment = Comment.new
    @comments = @bookmark.comments
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
   # @bookmark = Bookmark.new(params.require(:bookmark).permit(:title, :body, :hashtag))
   @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:title, :body, :hashtag))
   if @bookmark.save
     flash[:notice] = "Bookmark was saved."
     redirect_to @bookmark
   else
     flash[:error] = "There was an error saving! Please try again."
     render :new
   end
 end

 def edit
   @bookmark = Bookmark.find(params[:id])
 end

 def update
   @bookmark = Bookmark.find(params[:id])
   if @bookmark.update_attributes(params.require(:bookmark).permit(:title, :body, :hashtag))
     flash[:notice] = "Bookmark was updated."
     redirect_to @bookmark
   else
     flash[:error] = "There was an error saving! Please try again."
     render :edit
   end
 end
end
