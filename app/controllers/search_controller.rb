class SearchController < ApplicationController

def search
  if params[:q].nil?
    @bookmarks = []
  else
    @bookmarks = Bookmark.search params[:q]
  end
end




end
