require 'test/unit'

module TridiagonalMatrixDelegateContracts

    extend Test::Unit::Assertions
  
    def pre_initalize(rows)
    end
    def post_initialize()
      assert(!@dataStructure.nil?)
    end
    
    def self.pre_check(rows)
      assert(rows != nil, "Invalid parameters specified to initalize")
      assert(rows.respond_to?("[]"), "Rows doesn't respond to []")
      assert(rows.respond_to?("size"), "Rows doesn't respond to size")
    end
    
    def self.post_check()
      #None
    end
    
    def pre_equals?(other) 
      class_invariant 
      #None
    end
    def post_equals?()
      #None
      class_invariant
    end
    
    def pre_hash
      class_invariant
      #None
    end
    def post_hash(result)
      assert(!result.nil?,"Hash representation of class cannot be nil")
      class_invariant
    end

    def class_invariant
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
    
    def pre_minus_sign(m)
      class_invariant
      assert(m.respond_to?("-") || m.respond_to?("minus"))
    end
    def post_minus_sign(m, result)
      assert(!result.nil?, "Nil return detected")
      assert(result.row_size==@matrix.row_size, "Matrix returned has invalid row dimension: Expected-#{@matrix.row_size}, Result: #{result.row_size}")
      assert(result.column_size==@matrix.column_size, "Matrix returned has invalid column dimension: Expected-#{@matrix.column_size}, Result: #{result.column_size}")
      class_invariant
    end
    
    def pre_minus(m)
      class_invariant
      assert(!m.nil?)
      assert(m.respond_to?("row_size"))
      assert(m.respond_to?("column_size"))
      assert(m.respond_to?("[]"))
      assert(@matrix.row_size == m.row_size)
      assert(@matrix.column_size == m.column_size)
    end
    
    def post_minus(m, result)    
      assert(@matrix.row_size == result.row_size)
      assert(@matrix.column_size == result.column_size)
      
      sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
      @matrix.each(:all){ |e| sumElementsPre1 += e }
      m.each(:all){ |e| sumElementsPre2 += e }
      result.each(:all){ |e| sumElementsPost += e }
                    
      assert(sumElementsPre1 - sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} + Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
      
      class_invariant
    end
    
end
