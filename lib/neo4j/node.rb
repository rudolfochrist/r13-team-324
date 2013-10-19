require 'neography'

module Neo4j
  module Node
    def create_in_graph
      begin
        root = Neography::Node.load(0)
        self_node = Neography::Node.create(self.to_hash)
        Neography::Relationship.create(:is_bookmarked, root, self_node)
        root.outgoing(:is_bookmarked) << self_node
        true
      rescue 
        false
      end
    end

    def to_hash
      self.instance_variables.inject({}) do |hash, var|
        hash[var.to_s.delete('@')] = self.instance_variable_get(var)
        hash
      end
    end

    module ClassMethods
      def find
        'found'
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
