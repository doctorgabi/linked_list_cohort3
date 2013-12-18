class LinkedList

  def initialize(*payload)
    @counter = 0
    @last_node = nil
    #@payload = payload
    payload.each do |item|
      add_item(item)
    end
  end

#adds a new object with a payload to the last position in the list
  def add_item(payload)
    if @first_node.nil?
      @first_node = LinkedListItem.new(payload)
      @counter += 1
      @last_node = @first_node
    else
      last_node = @first_node
      while last_node.last? == false
        last_node = last_node.next_list_item
      end
      last_node.next_list_item = LinkedListItem.new(payload)
      @counter +=1
      @last_node = @last_node.next_list_item
    end
  end

#returns the value(payload) for a given key(index)
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

#returns the size of the linked list
  def size
    @counter
  end

#returns the value of the last node
  def last
    if @last_node.nil?
      nil
    else
      @last_node.payload
    end
  end

#converts the entire contents of the linked list to a string.
  def to_s
    if @first_node.nil?
      '| |'
    else
      @list = @first_node.payload
      x = @first_node
      while x.last? == false
        @list += ", #{x.next_list_item.payload}"
        x = x.next_list_item
      end
      '| ' + @list + ' |'
    end
  end

#takes the key and searches for its value
  def [](k)
    x = @first_node
    k.times do
      x = x.next_list_item
    end
    x.payload
  end

#takes the key and repalaces its value (payload) with user defined value
  def []= (k, v)
    x = @first_node
    k.times do
      x = x.next_list_item
    end
    x.payload = v
  end

#user passes index to remove. This removes the pointer from the index to its successor.
  def remove(index)
    if index > @counter
      raise IndexError
    elsif index == 0
      @first_node = @first_node.next_list_item
    else
      i = index - 1
      x = @first_node
      i.times do
        x = x.next_list_item
      end
      x.next_list_item = x.next_list_item.next_list_item
      end
    @counter -= 1
  end

#user passes in a value and this finds the key
  def indexOf(payload)
    counter = 0
    if @first_node
      x = @first_node
      comparison_payload = x.payload
      while comparison_payload != payload
        if x.next_list_item
          x = x.next_list_item
          comparison_payload = x.payload
          counter += 1
        else
          counter = nil
          break
        end
      end
    else
      counter = nil
    end
    counter
  end

#this does not sort it, it merely asks if it is sorted or not, Boolean.
 def sorted?
    if @first_node.nil?
      true
    elsif @first_node.next_list_item.nil?
      true
    else
      a = @first_node
      while a.next_list_item.nil? == false
        return a <= a.next_list_item #shorthand for true if...
        a = a.next_list_item
      end
    end
  end

#loops to grab each item and loops to compare it to each item and reorder pairwise.
  def sort
    unless @first_node.nil? || @first_node.last?
      comparator = @first_node
      index = 0
      @counter-1.times do
        if comparator > comparator.next_list_item# if 1st is > 2nd
          moving_item = comparator#call 1st the moving item
          moving_item.next_list_item = comparator.next_list_item.next_list_item.next_list_item#moving item's next = 4th
          comparator.next_list_item.next_list_item = moving_item #3rd = moving item
          remove(index)#cuts out the 1st(comparator) item so the rest will shuffle left one
          comparator = comparator.next_list_item#iterate the 1st to the next position
          index += 1#iterate the associated index
        end
      end
    end
    self
  end

end
    # #outer loop:
    # unless @first_node.nil? || @first_node.last?
    #   index = 0
    #   a = @first_node
    #   if a > a.next_list_item
    #     a = moving_item

    #     #inner loop:
    #     i = 0
    #     comparator = a.next_list_item
    #     @counter.times do
    #       if a < a.next_list_item

    #       comparator = comparator.next_list_item
    #     end
    #   remove(index)
    #   a = a.next_list_item
    #   index += 1
    #   end