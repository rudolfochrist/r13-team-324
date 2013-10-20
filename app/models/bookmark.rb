require 'neo4j'
require 'active_model'

class Bookmark
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Model
  include Neo4j::Node

  attr_accessor :title, :url, :description, :date_created, :id

  def initialize(attributes = {})
    attributes.each do |k, v|
      send("#{k}=", v)
    end
    @date_created ||= Time.now
  end

  def self.realtion_name
    :is_bookmarked
  end
end
