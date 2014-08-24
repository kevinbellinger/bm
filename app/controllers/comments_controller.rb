class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @bookmark = @bookmarks.find(params[:bookmark_id])
    @comments = @bookmark.comments

    @comment = current_user.comments.build( comment_params )
    @comment.bookmark = @bookmark
    @new_comment = Comment.new

    #authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@bookmark] }
    end
  end

      def destroy

   @bookmark = @bookmarks.find(params[:bookmark_id])

    @comment = @bookmark.comments.find(params[:id])
    # authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@bookmark] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :bookmark_id
    )
  end

end