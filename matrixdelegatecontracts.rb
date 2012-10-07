require 'test/unit'

module MatrixDelegateContracts
    
    include Test::Unit::Assertions

    def pre_method_missing(method_name, *args)
        assert(!method_name.nil?, "Delegated method name cannot be nil")
        assert(method_name.respond_to?("to_s"), "Delegated method representation must respond to to_s")
        assert(!method_name.to_s.empty?, "Delegated method representation's string cannot be empty")  
        assert(self.respond_to?(method_name.to_s) || @matrix.respond_to?(method_name.to_s),
               "Method \"#{method_name}\" not defined in delegate or Matrix class.")
    end
    def post_method_missing(method_name, *args)
    end

    def pre_create_matrix(matrix)
      assert(!matrix.nil?, "Argument cannot be nil for call to create matrix")
      assert(matrix.respond_to?("to_a"), "Input parameter requires to_a method")
      assert(matrix.respond_to?("send"), "Input parameter requires send method")
      assert(matrix.respond_to?("row_size"), "Input parameter requires row_size method")
      assert(matrix.respond_to?("column_size"), "Input parameter requires column_size method")
      assert(matrix.respond_to?("each"), "Input parameter requires each method")
      assert(matrix.respond_to?("replace_matrix_structure"), "Input parameter requires replace_matrix_structure method")
      assert(matrix.respond_to?("get_rows"), "Input parameter requires get_rows method")
    end
    def post_create_matrix(rows)
      assert(!@matrixData.nil?, "MatrixData incorrectly generated: nil value detected") 
      assert(!@matrix.nil?, "Matrix incorrectly generated: nil value detected") 
    end
    
    def pre_coerce()
      #None
    end
    
    def post_coerce(result)
      #Based on requirements of matrix]
      assert(!result.nil?, "Result of coercion cannot be nil")
      assert(result.is_a?(Array), "Result of coerce must be an array")
      assert(result.size == 2, "Coerce array result should have a return length of 2")  
    end
    
    def pre_scalar_operation(&block)
      class_invariant
      assert(block_given?)
    end
    
    def post_scalar_operation(result_matrix)    
      assert(@matrix.row_size == result_matrix.row_size)
      assert(@matrix.column_size == result_matrix.column_size)
      class_invariant
    end
    
    def class_invariant
    end
    
end
