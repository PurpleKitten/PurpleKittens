require 'test/unit'

module GeneralMatrixDelegateContracts
    
    def pre_to_s
      class_invariant
      #None
    end
    def post_to_s(result)
      class_invariant
      assert(!result.nil?,"String representation of class cannot be nil")
      assert(result.is_a?("String"),"to_s Must return a string")
      assert(!result.empty?,"to_s Cannot be empty")
    end
    
    def pre_hash
      class_invariant
      #None
    end
    def post_hash(result)
      assert(!result.nil?,"hash representation of class cannot be nil")
      class_invariant
    end
    
    def pre_equals?() 
      class_invariant 
      #None
    end
    def post_equals?()
      #None
      class_invariant
    end
    
    def pre_each_sparse(&block)
      class_invariant
      assert(block_given?)
      assert(@matrixData.respond_to?("each_sparse"), "Delegate data structure must respond to each_sparse")
    end
    
    def post_each_sparse(&block)
      class_invariant
    end
    
    def class_invariant
      assert(!dataStructure.nil?)
      assert(@matrix.to_a == @matrixData.to_a)
    end
end
