class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    child1 = parent_index * 2 + 1
    child2 = child1 + 1
    if child1 < len && child2 < len
      return [child1, child2] 
    elsif child1 < len
      return [child1] 
    elsif child2 < len
      return [child2]
    else return nil 
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1 ) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
