require 'test/unit'

module SparseMatrixContracts
    
    include Test::Unit::Assertions

    #DO NOT CHANGE
    #We only turn this override on in class invariant to avoid recursion issue
    @@override = false
    
    #CHANGE FOR SPEED, BUT INVARIANTS WILL NOT BE CHECKED
    @@override_class_invariants = false
  
    @@pre_symbol = :pre
    @@post_symbol = :post
    
    NIL_RETURNED = "Returned value was detected to be nil"
    NIL_PROVIDED = "Value provided was detected to be nil"
    SELF_SQUARE = "Matrix must be square for this operation"
    SELF_REGULAR = "Matrix must be regular for this operation"
    PROVIDED_SQUARE = "Matrix provided must be square for this operation"
    INVARIANT = "Invariant Violated: "
    
    
    def pre_init(rows)           
          assert(!rows.nil?, NIL_PROVIDED)
          assert(rows.is_a?(Array), 'Input rows must be an array.')
    end
    def post_init()       
        assert(!@delegate.nil?, "Delegate generated is nil")
        assert(!@matrix.nil?, "Internal matrix structure is nil")
        assert(@delegate.to_a == @matrix.to_a, 'Sparse Matrix not initialized properly.')
    end

    def pre_diagonal?()
        assert(self.square?(), SELF_SQUARE)
        class_invariant
    end
    def post_diagonal?()
    end
    
    def pre_empty?()
    end
    def post_empty?()
    end

    def pre_multiply(m)
        assert(!m.nil?, "Sparse matrix to * against cannot be nil")     
        assert(m.respond_to?("multiply") || m.respond_to?("*"), "Unable to multiply on #{m.inspect}")
        
        if(m.respond_to?("multiply"))
          assert(self.column_size==m.row_size, "Incorrect matrix dimensions: [#{self.row_size},#{self.column_size}] x [#{m.row_size},#{m.column_size}]")
        end
    end
    def post_multiply(m, result)
        assert(!result.nil?, NIL_RETURNED)
        
        if(m.respond_to?("multiply"))
          assert(result.row_size==self.row_size, "Matrix returned has invalid row dimension: Expected-#{self.row_size}, Result: #{result.row_size}")
          assert(result.column_size==m.column_size, "Matrix returned has invalid column dimension: Expected-#{self.column_size}, Result: #{result.column_size}")
        end
    end
    
    def pre_exponential( m)
        assert(!m.nil?, NIL_PROVIDED)     
        assert(m.is_a?(Integer), "Input value must be an integer")
        assert(self.square?(), SELF_SQUARE)
            
        if(m <= 0)
          assert(self.regular?(), "When value provided is less than 0, the matrix must be regular.")
        end
      
    end
    def post_exponential( m, result)
        assert(!result.nil?, NIL_RETURNED)
        assert(self.row_size==result.row_size, "Matrix returned has invalid row dimension: Expected-#{self.row_size}, Result: #{result.row_size}")
        assert(self.column_size==result.column_size, "Matrix returned has invalid column dimension: Expected-#{self.column_size}, Result: #{result.column_size}")
      
    end
    
    def pre_addition( m)
        assert(!m.nil?, NIL_PROVIDED)     
        assert(m.respond_to?("plus") || m.respond_to?("+"), "Addition not supported on provided parameter") 
        
        if m.respond_to?("plus")
          assert(self.row_size==m.row_size, "Matrix provided has invalid row dimension: Expected-#{self.row_size}, Provided: #{m.row_size}")
          assert(self.column_size==m.column_size, "Matrix provided has invalid column dimension: Expected-#{self.column_size}, Provided: #{m.column_size}")
        end
    end
    def post_addition( m, result)
        assert(!result.nil?, NIL_RETURNED)
        assert(result.row_size==self.row_size, "Matrix returned has invalid row dimension: Expected-#{self.row_size}, Result: #{result.row_size}")
        assert(result.column_size==self.column_size, "Matrix returned has invalid column dimension: Expected-#{self.column_size}, Result: #{result.column_size}")
        
        if m.respond_to?("plus")
          sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
          @matrix.each(:all){ |e| sumElementsPre1 += e }
          m.each(:all){ |e| sumElementsPre2 += e }
          result.each(:all){ |e| sumElementsPost += e }
                
          assert(sumElementsPre1 + sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} + Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
        end
    end
    
    def pre_subtraction( m)
        assert(!m.nil?, NIL_PROVIDED)     
        assert(m.respond_to?("minus") || m.respond_to?("-"), "Subtraction not supported on provided parameter") 
              
        if m.respond_to?("minus")
          assert(self.row_size==m.row_size, "Matrix provided has invalid row dimension: Expected-#{self.row_size}, Provided: #{m.row_size}")
          assert(self.column_size==m.column_size, "Matrix provided has invalid column dimension: Expected-#{self.column_size}, Provided: #{m.column_size}")
        end
    end
    def post_subtraction( m, result)
        assert(!result.nil?, NIL_RETURNED)
        assert(result.row_size==self.row_size, "Matrix returned has invalid row dimension: Expected-#{self.row_size}, Result: #{result.row_size}")
        assert(result.column_size==self.column_size, "Matrix returned has invalid column dimension: Expected-#{self.column_size}, Result: #{result.column_size}")
        
        if m.respond_to?("minus")   
          sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
          @matrix.each(:all){ |e| sumElementsPre1 += e }
          m.each(:all){ |e| sumElementsPre2 += e }
          result.each(:all){ |e| sumElementsPost += e }
                          
          assert(sumElementsPre1 - sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} - Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
        end
    end  
    
    def pre_divide( m)
        assert(!m.nil?, NIL_PROVIDED)          
        assert(m.respond_to?("divide") || m.respond_to?("/"), "Division not supported on provided parameter")
                  
        if m.respond_to?("divide")
          assert(self.square?(), SELF_SQUARE)
          assert(self.regular?(), SELF_REGULAR)
          assert(self.row_size==m.row_size, "Matrix provided has invalid row dimension: Expected-#{self.row_size}, Provided: #{m.row_size}")
          assert(self.column_size==m.column_size, "Matrix provided has invalid column dimension: Expected-#{self.column_size}, Provided: #{m.column_size}")
        end
    end
    def post_divide( m, result)
        assert(!result.nil?, NIL_RETURNED)
        
        if m.respond_to?("divide")
          assert(result.row_size==self.row_size, "Matrix provided has invalid row dimension: Expected-#{self.row_size}, Result: #{result.row_size}")
          assert(result.column_size==self.column_size, "Matrix provided has invalid column dimension: Expected-#{self.column_size}, Result: #{result.column_size}")
        end
    end
    
    def pre_equals?()
    end
    def post_equals?()
    end 
    
    def pre_access_ij_element(i,j)
    end 
    def post_access_ij_element(result)
        assert(!result.nil?, NIL_RETURNED)
    end
    
    def pre_set_ijk_element(i,j)
    end 
    def post_set_ijk_element(result)
        assert(!result.nil?, NIL_RETURNED)
    end
    
    def pre_coerce(m)
    end
    def post_coerce(result)
        assert(!result.nil?, NIL_RETURNED)
    end
    
    def pre_determinant()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_determinant(result)
    end
    
    def pre_empty?()
    end
    def post_empty?(result)
    end
    
    #TODO
    def pre_find_index(args)
        assert(args!=nil, NIL_PROVIDED)
        assert(args.size() >=0 && args.size() < 2, "Index")
    end
    
    def post_find_index(result)
        assert(!result.nil?, NIL_RETURNED)
    end    
    
    def pre_hash()
    end
    def post_hash(result)
        assert(result!=null,NIL_RETURNED)
    end
    
    def pre_hermitian?()
      assert(self.square?(), SELF_SQUARE)
    end
    def post_hermitian?()
    end
    
    def pre_inverse()
        assert(self.square?(), SELF_SQUARE)
        assert(self.regular?(), SELF_REGULAR)
    end
    def post_inverse( result)
        identity = Matrix.identity(self.row_size())
        assert(result * self == identity, "Invalid Inverse detected")
        assert(self * result  == identity, "Invalid Inverse detected")
    end
    
    def pre_lower_triangular?()
    end
    def post_lower_triangular?()
    end
    
    def pre_normal?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_normal?()
    end
    
    def pre_orthogonal?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_orthogonal?()
    end
    
    def pre_permutation?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_permutation?()
    end
    
    def pre_rank()
    end
    def post_rank(result)
        assert(!result.nil?, NIL_RETURNED)
        assert(result.to_i <= row_size, "Rank determined greater than max possible value.")
        assert(result.to_i >= 0, "Rank determined was less than zero.")
    end
      
    def pre_regular?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_regular?(result)
    end
      
  def pre_round?()
      assert(self.square?(), SELF_SQUARE)
  end
  def post_round?( result)
      assert(!result.nil?, NIL_RETURNED)
      assert(result.row_size==self.row_size, "Matrix size should not have changed during rounding.")
      assert(result.column_size==self.column, "Matrix size should not have changed during rounding.")
  end
    
    def pre_row_size()
    end
    def post_row_size(result)
        assert(result!=nil, NIL_RETURNED)
        assert(result >= 0, "Row length must be greater than zero.")
        assert(result == @matrix.row_size, "Unexpected row size returned.")
      
    end
    
    def pre_column_size()
    end
    def post_column_size(result)
        assert(result!=nil, NIL_RETURNED)
        assert(result >= 0, "Row Column must be greater than zero")
        assert(result == @matrix.column_size, "Unexpected column size returned")
    end
    
    def pre_singular?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_singular?()
    end
    
    def pre_square?()
    end
    def post_square?()
    end
    
    def pre_symmetric?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_symmetric?()
    end
    
    def pre_to_a()
    end
    def post_to_a(result)
        assert(result!=nil, NIL_RETURNED)
        assert(result.is_a?(Array), "Returned value must be an Array")
    end
    
    def pre_to_s()
    end
    def post_to_s(result)
        assert(result!=nil, NIL_RETURNED)
        assert(result.is_a?(String), "Returned value must be a String")
    end
      
    def pre_trace()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_trace(result)
        assert(result != nil, NIL_RETURNED)
    end
    
    def pre_transpose()
    end
    def post_transpose( result)
        assert(!result.nil?, NIL_RETURNED)
        
        sumElementsPre,sumElementsPost = 0, 0
        @matrix.each(:all){ |e| sumElementsPre += e }
        result.each(:all){ |e| sumElementsPost += e }
          
        assert(sumElementsPre == sumElementsPost, "Pre: #{sumElementsPre}, Post: #{sumElementsPost}")
    end
    
    def pre_unitary?()
        assert(self.square?(), SELF_SQUARE)
    end
    def post_unitary?()
    end
    
    def pre_upper_triangular?()
    end
    def post_upper_triangular?()
    end

    def pre_zero?()
    end
    def post_zero?()
    end
    
    def pre_delegate_method(method_name)
        assert(!method_name.nil?, "Provided method for delegation cannot be nil")
        assert(method_name.respond_to?("to_s"), "Provided method to delegate (by name of method) must respond to to_s")
        assert(!method_name.to_s.empty?, "to_s of method name cannot be empty")  
    end
    
    def post_delegate_method()
    end
    
    def pre_each(which, &block)
      assert(!which.nil?)
      matrix_each_options = [:all, :diagonal, :off_diagonal, :lower , :strict_lower, :strict_upper, :upper]
      assert(matrix_each_options.include?(which))
      
    end
    
    def post_each()   
    end
    
    def pre_each_sparse(&block)
      assert(block_given?)
    end
    
    def post_each_sparse()
    end

    
    def class_invariant
      return if @@override
      return if @@override_class_invariants
      
      #TODO Might need to caught exceptions because of this (when its true we aren't running pre/post conditions 
      #- it would cause infinite recursion)
      @@override = true  
     
      @matrix.row_size == @delegate.row_size
      @matrix.column_size == @delegate.column_size

      @matrix == @delegate
        
      side_length_1 = self.row_size
      side_length_2 = self.column_size
      side_length_3 = rand(1..6)
      side_length_4 = rand(1..6)
      
      smatrixA = self
      smatrixB = SparseMatrix.new(:build, side_length_2,side_length_3) { rand(1..20) }
      smatrixC = SparseMatrix.new(:build, side_length_3,side_length_4) { rand(1..20) }
      
      #A(BC)=(AB)C
      assert((smatrixA * smatrixB)  *  smatrixC == smatrixA * ( smatrixB * smatrixC), INVARIANT + "A(BC)=(AB)C") 
      
      #(AB)^T = B^T*A^T
      assert((smatrixA * smatrixB).transpose() ==  smatrixB.transpose() * smatrixA.transpose(), INVARIANT + "(AB)^T = B^T*A^T")
      
      #a(BC)=(aB)C
      assert(side_length_3 * (smatrixB * smatrixC) == (side_length_3 * smatrixB) * smatrixC, INVARIANT + "a(BC)=(aB)C")
      
      #(AB)a=A(Ba)
      assert((smatrixA * smatrixB)*side_length_3 == smatrixA * (smatrixB * side_length_3), INVARIANT + "(AB)a=A(Ba)")
      
      #rank [A] = rank(A^T*A)= rank(A*A^T)
      rank1 = smatrixA.rank()
      rank2 = (smatrixA.transpose()*smatrixA).rank()
      rank3 = (smatrixA*smatrixA.transpose()).rank()
      
      assert(rank1 == rank2, INVARIANT + "rank [A] = rank(A^T*A)= rank(A*A^T)")
      assert(rank2 == rank3, INVARIANT + "rank [A] = rank(A^T*A)= rank(A*A^T)")
      assert(rank3 == rank1, INVARIANT + "rank [A] = rank(A^T*A)= rank(A*A^T)")
      
      side_length_1 = self.row_size
      side_length_2 = self.column_size
            
      smatrixA = self
      smatrixB = SparseMatrix.new(:build, side_length_1,side_length_2) { rand(1..20) }
      smatrixC = SparseMatrix.new(:build, side_length_1,side_length_2) { rand(1..20) }
      
      #A + B = B + A
      assert(smatrixA + smatrixB == smatrixB + smatrixA, INVARIANT + "A + B = B + A")
      
      #(A + B)T = AT + BT
      assert((smatrixA + smatrixB).transpose() == smatrixA.transpose() + smatrixB.transpose(), INVARIANT + "(A + B)T = AT + BT")
      
      #A-B = A + -B
      assert(smatrixA - smatrixB == smatrixA + (-1 * smatrixB), INVARIANT + "A-B = A + -B")
      
      if(side_length_1 > 0)
        smatrixI = SparseMatrix.new(:identity, side_length_1) { rand(1..20) }
        #I=Rowsize*Rowsize
        #Ix = X
        assert(smatrixI * self == self, INVARIANT + "Ix = X")

        smatrixI = SparseMatrix.new(:identity, side_length_2) { rand(1..20) }
        #I=columnsize*columnsize
        #xI = x
        assert(self * smatrixI == self, INVARIANT + "xI = x")
      end
      
      if(self.square?)
        #(A+B)C=AC+BC
        assert(((smatrixA + smatrixB) * smatrixC) == (smatrixA * smatrixC + smatrixB * smatrixC), INVARIANT + "(A+B)C=AC+BC")
        
        #trace(A)=trace(A^T)
        assert(smatrixA.trace() == smatrixA.transpose().trace(), INVARIANT + "trace(A)=trace(A^T)")
        
        #trace(A+B)=trace(A) + trace(B)
        assert((smatrixA + smatrixB).trace() == smatrixA.trace() + smatrixB.trace(), INVARIANT + "trace(A+B)=trace(A) + trace(B)")
        
        #det(AB)=det(A)det(B)
        assert((smatrixA * smatrixB).determinant() == smatrixA.determinant() * smatrixB.determinant(), INVARIANT + "det(AB)=det(A)det(B)")
        
        if(self.regular?())
           
          #AA-1 = A-1A = I  
          assert(smatrixA * smatrixA.inverse == smatrixI, INVARIANT + "AA-1 = A-1A = I")
          assert(smatrixA.inverse * smatrixA == smatrixI, INVARIANT + "AA-1 = A-1A = I")
    
          #(A^-1)^-1  =  A
          assert((smatrixA.inverse()).inverse() == smatrixA, INVARIANT + "(A^-1)^-1  =  A")
          
          #(A^T)^-1 =(A^-1)^T 
          assert(smatrixA.transpose().inverse() == (smatrixA.inverse()).transpose(), INVARIANT + "(A^T)^-1 =(A^-1)^T ")
       
          if(smatrixB.regular?())
            #(AB)^-1 =  B^-1A^-1         
            assert((smatrixA * smatrixB).inverse() == smatrixB.inverse() * smatrixA.inverse(), INVARIANT + "(AB)^-1 =  B^-1A^-1")
          
            #A / B = A (/B)
            assert(smatrixA / smatrixB = smatrixA * (smatrixB.inverse()), INVARIANT + "A \/ B = A (\/B)")
          end 
          
        end     
      end        
      
      @@override = false
    end
end