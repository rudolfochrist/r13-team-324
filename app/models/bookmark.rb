require 'active_model'
class Bookmark
	extend ActiveModel::Naming
	include ActiveModel::Conversion

	attr_accessor :title, :url, :description
end