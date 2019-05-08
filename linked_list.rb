class LinkedList
attr_accessor :node_head
  def initialize(data)
    @node_head = Node.new(data)
  end

  def append(node)
    # add a node to the end of the list
    current_node = self.node_head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = node
  end

  def prepend(node)
    #add a node to the beginning of the list
    previous_node = self.node_head
    self.node_head = node
    self.node_head.next_node = previous_node
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

n1 = Node.new("first added")
n2 = Node.new("second added")
n3 = Node.new("third added to the beggining")
x = LinkedList.new("start")

x.append(n1)
x.append(n2)
x.prepend(n3)

z = x.node_head
while z != nil
  puts z.value
  z = z.next_node
end