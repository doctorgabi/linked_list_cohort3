class LinkedList

  def add_item(payload)
    if @first_node.nil?
      @first_node = LinkedListItem.new(payload)
    else
      # loop across your list, find which one is last, add to that,
      @first_node.next_list_item = LinkedListItem.new(payload)
    end
      # use last? to get to the last one and then add the next item
  end

  def get(index)
    current_node = @first_node
    index.times do
      current_node = current_node.next_list_item
    end
    current_node.payload
  end

end