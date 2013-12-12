
class LinkedListItem
  include Comparable
  attr_accessor :payload, :next_list_item

  def <=>(a)
    self.payload <=> a.payload
  end

  def ===(a)
    self.object_id == a.object_id
  end

  def initialize (payload)
    @payload = payload
  end

  def next_list_item=(next_list_item)
    if next_list_item == self
      raise ArgumentError
    else
      @next_list_item = next_list_item
    end
  end

  def last?
    if next_list_item == nil
      true
    else
      false
    end
  end

end