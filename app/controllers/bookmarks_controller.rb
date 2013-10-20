class BookmarksController < ApplicationController
  def index
    m1 = Bookmark.new
    m1.url="elevensongs.com"
    m1.title = "Eleven Songs"
    m1.description = "The eleven most annoying songs in the world"

    m2 = Bookmark.new
    m2.url = "mtb.edu"
    m2.title = "Math Gym"
    m2.description = "Math courses and training"

    m3 = Bookmark.new
    m3.url = "http://www.google.de"
    m3.title = "Test"
    m3.description = "Test the best"

    @latest_bookmarks = [m1]
    @all_bookmarks = Bookmark.all
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
