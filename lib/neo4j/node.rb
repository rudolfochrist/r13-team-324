require 'neography'

module Neo4j
  module Node
    def create_in_graph
      begin
        root = Neography::Node.load(0)
        self_node = Neography::Node.create(self.to_hash)
        root.outgoing(self.class.realtion_name) << self_node
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

    def destory
      Neography::Node.load(id).del
    end

    module ClassMethods
      def all
        root = Neography::Node.load(0)
        root.outgoing(self.realtion_name).take(20).map do |node|
          obj = self.new(node.instance_variable_get(:@table))
          obj.id = node.neo_id
          obj
        end.reverse
      end

      def find(id)
        node = Neography::Node.load(id)
        obj = self.new(node.instance_variable_get(:@table))
        obj.id = node.neo_id
        obj
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
