class Graph

    def initialize
        @nodes = {}
    end

    def add_node(node)
        @nodes[node.value] = node
    end

    def add_edge(node1, node2)
        @nodes[node1.value].add_edge(@nodes[node2.value])
        @nodes[node2.value].add_edge(@nodes[node1.value])
    end

    def get_node(value = nil)
        if !value.nil?
            return @nodes[value]
        else
            return @nodes[@nodes.keys[rand(0..size)]]
        end
    end

    def size
        return @nodes.keys.size
    end

end