require_relative 'heap'

class Array
    def heapify!
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
    
    def heapDown(k)
        # debugger
        self.heapify!
        ans = []
        prc = Proc.new do |el1, el2|
          -1 * (el1 <=> el2)
        end
        heap_line = self.length - 2
        heap_line.downto(k).each do |end_of_slice|
          # debugger
          self[0], self[end_of_slice+1] = self[end_of_slice+1], self[0]
          BinaryMinHeap.heapify_down(self, 0, len = end_of_slice+1, &prc) + self[end_of_slice+1..-1]
        end
        self
      end
end

def k_largest_elements(array, k)
    array.heapDown(k)
    array[array.length-k..-1]
end


