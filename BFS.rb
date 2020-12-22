class BFS
    
    attr_reader :start_node, :end_node, :queue, :visited

    def initialize(start_node, end_node)
        @start_node = start_node
        @end_node = end_node
        @queue = [{ start_node => nil }]
        @visited = [ start_node ]
    end

    def get_path
        while !queue.empty?
            node = queue.pop
            if node.keys.first == end_node
                path = []
                until node == nil
                    path << node.keys.first.value
                    node = node[node.keys.first]
                end
                return path.reverse
            end
            node.keys.first.adjacent_nodes.each do |n|
                if !visited.include?(n)
                    queue.prepend({ n => node })
                    visited << n
                end
            end
        end
    end


    # NOT WORKING
    # def get_paths
    #     paths = []
    #     while !queue.empty?
    #         node = queue.pop
    #         if node.keys.first == end_node
    #             path = []
    #             visited.clear
    #             until node == nil
    #                 visited << node.keys.first
    #                 path << node.keys.first.value
    #                 node = node[node.keys.first]
    #             end
    #             paths << path.reverse
    #             queue.prepend({ start_node => nil })
    #         else
    #             node.keys.first.adjacent_nodes.each do |n|
    #                 if !visited.include?(n)
    #                     queue.prepend({ n => node })
    #                     visited << n
    #                 end
    #             end
    #         end
    #     end
    #     return paths
    # end

end
