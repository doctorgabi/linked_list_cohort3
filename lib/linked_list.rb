class LinkedList

  def initialize(*payload)
    @counter = 0
    @last_node = nil
    payload.each do |item|
      add_item(item)
    end
  end

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

  def [](k)
    x = @first_node
    k.times do
      x = x.next_list_item
    end
    x.payload
  end

  def []= (k, v)
    x = @first_node
    k.times do
      x = x.next_list_item
    end
    x.payload = v
  end

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

  def indexOf(payload)
    counter = 0
    if @first_node
      x = @first_node
      comparison_payload = x.payload

      while comparison_payload != payload
        if x
          x = x.next_list_item
          if x
            comparison_payload = x.payload
            counter += 1
          else
            counter = nil
            break
          end
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



end