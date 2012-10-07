require 'test/unit'

module GeneralMatrixDelegateContracts

    def pre_plus_sign(m)
      class_invariant
      assert(m.respond_to?("+") || m.respond_to?("plus"))
    end
    def post_plus_sign(m, result)
      assert(!result.nil?, "Nil return detected")
      assert(result.row_size==@matrix.row_size, "Matrix returned has invalid row dimension: Expected-#{@matrix.row_size}, Result: #{result.row_size}")
      assert(result.column_size==@matrix.column_size, "Matrix returned has invalid column dimension: Expected-#{@matrix.column_size}, Result: #{result.column_size}")
      class_invariant
    end
    
  def pre_plus(m)
    class_invariant
    assert(!m.nil?)
    assert(m.respond_to?("row_size"))
    assert(m.respond_to?("column_size"))
    assert(m.respond_to?("[]"))
    assert(@matrix.row_size == m.row_size)
    assert(@matrix.column_size == m.column_size)
  end
  
  def post_plus(m, result)    
    assert(@matrix.row_size == result.row_size)
    assert(@matrix.column_size == result.column_size)
    
    sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
    @matrix.each(:all){ |e| sumElementsPre1 += e }
    m.each(:all){ |e| sumElementsPre2 += e }
    result.each(:all){ |e| sumElementsPost += e }
                  
    assert(sumElementsPre1 + sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} + Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
    
    class_invariant
  end
    
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
    
    def class_invariant
      assert(!dataStructure.nil?)
    end
end
