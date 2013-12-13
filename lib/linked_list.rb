class LinkedList
  def add_item(payload)
    if @first_node.nil?
      @first_node = LinkedListItem.new(payload)
    else
      last_node = @first_node
      while last_node.last? == false
        last_node = last_node.next_list_item
      end
      last_node.next_list_item = LinkedListItem.new(payload)
    end
  end


  def get(index)
    counter = 0
    if index < 0
      raise IndexError
    else
      current_node = @first_node
      index.times do
        if current_node == nil
          raise IndexError
        else
          current_node = current_node.next_list_item
        end
      end
      current_node.payload
    end
  end
end