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

  	@bookmarks = [m1,m2,m3]
  end

  def new
  	@bookmark = Bookmark.new
  end

  def create
  	 redirect_to action: "index"
  end
end
