class BookmarksController < ApplicationController
  def index
    @all_bookmarks = Bookmark.all

    @latest_bookmarks = @all_bookmarks.select do |bookmark|
      bookmark.date_created >= 5.hours.ago
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.create_in_graph
      redirect_to bookmarks_url, flash: { success: 'Bookmark added' }
    else
      flash.now[:danger] = "We're so sorry but something went wrong!"
      render :new
    end
  end

   def edit
    redirect_to action: "new"
  end

  def destroy
    redirect_to action: "index"
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:title, :url, :description)
    end


end
