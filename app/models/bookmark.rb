require 'neo4j'
require 'active_model'

class Bookmark
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include Neo4j::Node

  attr_accessor :title, :url, :description
end
