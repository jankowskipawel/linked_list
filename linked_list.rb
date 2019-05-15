class LinkedList
attr_accessor :node_head
  def initialize(data)
    @node_head = Node.new(data)
  end

  def display()
    z = self.node_head
    while z != nil
      puts z.value
      z = z.next_node
    end
  end

  # add a node to the end of the list
  def append(node)
    current_node = self.node_head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = node
  end

  #add a node to the beginning of the list
  def prepend(node)
    previous_node = self.node_head
    self.node_head = node
    self.node_head.next_node = previous_node
  end

  def size()
    i=0
    z = self.node_head
    while z != nil
      i += 1
      z = z.next_node
    end
    return i
  end

  def head()
    return self.node_head
  end

  def tail()
    x = self.node_head
    while x.next_node != nil
      x = x.next_node
    end
    return x
  end

  #returns the node at the given index
  def at(index)
    x = self.node_head
    index.times do
      x = x.next_node
    end
    return x
  end

  def pop()
    x = self.at(self.size-2)
    x.next_node = nil
  end

  def contains?(value)
    z = self.node_head
    while z != nil
      return true if z.value == value
      z = z.next_node
    end
    return false
  end


  #returns the index of the node containing data, or nil if not found
  def find(data)
    z = self.node_head
    i=0
    while z != nil
      return i if data == z.value
      z = z.next_node
      i += 1
    end
    return nil
  end

  def to_s()
    z = self.node_head
    result = "(#{z.value}) "
    z = z.next_node
    while z != nil
      result += " -> (#{z.value})"
      z = z.next_node
    end
    result += " -> (nil)"
    return result
  end

  def insert_at(index, node)
    if index == 0 
      node.next_node = self.node_head
      self.node_head = node
      return
    end
    a = self.at(index-1)
    node.next_node = a.next_node
    a.next_node = node
  end

  def remove_at(index)
    if index == 0 
      self.node_head = self.node_head.next_node
    end
    a = self.at(index-1)
    b = a.next_node
    a.next_node = b.next_node
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
n4 = Node.new("fourth added to index")
x = LinkedList.new("start")

x.append(n1)
x.append(n2)
x.prepend(n3)

x.display
# puts x.size
# puts x.head.value
# puts x.tail.value
# puts x.at(0).value
puts "\n"
# x.pop
# x.display
# puts x.contains?("third added to the beggining")
# puts x.find("third added to the beggining")
# puts x.to_s

x.insert_at(0, n4)
x.display
#.remove_at(4)
