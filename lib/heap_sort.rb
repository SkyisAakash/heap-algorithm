require_relative "heap"
require'byebug'

class Array
  def heap_sort!
    self.heapify!
  end

  def heapify
    (1..length-1).each do |heap_line|
      # debugger
      correct = false
      target_idx = heap_line
      while correct === false
        break if target_idx == 0
        parent = BinaryMinHeap.parent_index(target_idx)
        correct = true
        if parent
          if self[parent] < self[target_idx]
            self[parent], self[target_idx] = self[target_idx], self[parent]
            target_idx = parent
            correct = false
          end
        end
      end
    end
  end
end

a = [6,4,5,7,8]
a.heapify
puts(a)
