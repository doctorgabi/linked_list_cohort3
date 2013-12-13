class LinkedList

  def initialize(payload = nil)
    @counter = 0
    @last_node = nil
    if payload
      @list = payload
    else
     @list = nil
   end
  end


  # def test_17_initialize_takes_seed_arguments
  #   ll = LinkedList.new("foo", "bar", "grille")
  #   assert_equal '| foo, bar, grille |', ll.to_s
  # end


  def add_item(payload)
    if @first_node.nil?
      @first_node = LinkedListItem.new(payload)
      @counter += 1
      @last_node = @first_node
      @list = payload
    else
      current_node = @first_node
      while current_node.last? == false
        current_node = current_node.next_list_item
      end
      last_node.next_list_item = LinkedListItem.new(payload)
      @counter +=1
      @last_node = @last_node.next_list_item
      @list += ', ' + payload
    end
  end

  def get(index)
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

  def size
    @counter
  end

  def last
    if @last_node.nil?
      nil
    else
      @last_node.payload
    end
  end

  def to_s
    if @list.nil?
      "| |"
    else
      '| ' + @list + ' |'
    end
  end

end