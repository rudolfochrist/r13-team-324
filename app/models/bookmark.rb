require 'neo4j'
require 'active_model'

class Bookmark
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Model
  include Neo4j::Node

  attr_accessor :title, :url, :description, :date_created

  def initialize
    @date_created = Time.now
  end
end
