class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
