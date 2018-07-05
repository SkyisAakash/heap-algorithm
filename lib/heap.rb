require 'byebug'
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    # parent_idx = BinaryMinHeap.parent_idx(@store.length - 1)
    BinaryMinHeap.heapify_up(@store, @store.length - 1) unless @store.length == 1
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
    else return []
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1 ) / 2
  end

  def self.swap(arr, a,b)
    arr[a], arr[b] = arr[b], arr[a]
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    # debugger
    prc ||= Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    # debugger
    correct = false
    while correct == false
      correct = true
      children = BinaryMinHeap.child_indices(len, parent_idx)
      if children.length > 1
        # child = array[children[0]] < array[children[1]] ? children[0] : children[1] 
          child = prc.call(array[children[0]],array[children[1]]) == -1 ? children[0] : children[1] 
      else child = children[0] 
      end
      if child
        # if array[parent_idx] > array[child] 
        if prc.call(array[parent_idx], array[child]) >= 1
          BinaryMinHeap.swap(array, parent_idx, child) 
          BinaryMinHeap.heapify_down(array, child, len, &prc)
          correct = false
        end
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    raise "root has no parent" if child_idx == 0
    prc ||= Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    correct = false
    while correct == false
      correct = true
      parent = BinaryMinHeap.parent_index(child_idx)
      if parent
        # if array[parent] > array[child_idx]
        if prc.call(array[parent], array[child_idx]) >= 1
          BinaryMinHeap.swap(array, parent, child_idx)
          BinaryMinHeap.heapify_up(array, parent, len, &prc) unless parent == 0
          correct = false
        end
      end
    end
    array
  end
end
