require 'test/unit'

module SparseMatrixContracts
    
    include Test::Unit::Assertions

    #DO NOT CHANGE
    #We only turn this override on in class invarient to fix the whole
    @@override = false
    
    @@pre_symbol = :pre
    @@post_symbol = :post
    
    NIL_RETURNED = "Returned value was detected to be nil"
    NIL_PROVIDED = "Value provided was detected to be nil"
    SELF_SQUARE = "Matrix must be square for this operation"
    SELF_REGULAR = "Matrix must be regular for this operation"
    PROVIDED_SQUARE = "Matrix provided must be square for this operation"
    INVARIANT = "Invariant Violated: "
    
    
    def conditional(position)
       return if @@override
      
       class_invariant if position == @@pre_symbol  
      yield()
       class_invariant if position == @@post_symbol
    
    end
    
    def pre_init(rows)           
          assert(!rows.nil?, NIL_PROVIDED)
          assert(rows.is_a?(Array), 'Input rows must be an array.')
    end
    def post_init()       
        assert(!@delegate.nil?, "Delegate generated is nil")
        assert(!@matrix.nil?, "Internal matrix structure is nil")
        assert(@delegate.to_a == @matrix.to_a, 'Sparse Matrix not initialized properly.')
    end

    def pre_diagonal?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
        class_invariant
      end
    end
    def post_diagonal?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_empty?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_empty?()
      conditional(@@post_symbol) do
        #None
      end
    end

    def pre_multiply(sm_self,m)
      conditional(@@pre_symbol) do
        assert(!m.nil?, "Sparse matrix to * against cannot be nil")     
        assert(m.respond_to?("multiply") || m.respond_to?("*"), "Unable to multiply on #{m.inspect}")
        
        if(m.respond_to?("multiply"))
          assert(sm_self.column_size==m.row_size, "Incorrect matrix dimensions: [#{sm_self.row_size},#{sm_self.column_size}] x [#{m.row_size},#{m.column_size}]")
        end
      end
    end
    def post_multiply(sm_self,m, result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        assert(result.row_size==sm_self.row_size, "Matrix returned has invalid row dimension: Expected-#{sm_self.row_size}, Result: #{result.row_size}")
        assert(result.column_size==m.column_size, "Matrix returned has invalid column dimension: Expected-#{sm_self.column_size}, Result: #{result.column_size}")
      end
    end
    
    def pre_exponential(sm_self, m)
      conditional(@@pre_symbol) do
        assert(!m.nil?, NIL_PROVIDED)     
        assert(m.is_a?(Integer), "Input value must be an integer")
        assert(sm_self.square?(), SELF_SQUARE)
            
        if(m <= 0)
          assert(sm_self.regular?(), "When value provided is less than 0, the matrix must be regular.")
        end
      end
      
    end
    def post_exponential(sm_self, m, result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        assert(sm_self.row_size==result.row_size, "Matrix returned has invalid row dimension: Expected-#{sm_self.row_size}, Result: #{result.row_size}")
        assert(sm_self.column_size==result.column_size, "Matrix returned has invalid column dimension: Expected-#{sm_self.column_size}, Result: #{result.column_size}")
      end
      
    end
    
    def pre_addition(sm_self, m)
      conditional(@@pre_symbol) do
        assert(!m.nil?, NIL_PROVIDED)     
        assert(m.respond_to?("plus") || m.respond_to?("+"), "Addition not supported on provided parameter") 
        
        if m.respond_to?("plus")
          assert(sm_self.row_size==m.row_size, "Matrix provided has invalid row dimension: Expected-#{sm_self.row_size}, Provided: #{m.row_size}")
          assert(sm_self.column_size==m.column_size, "Matrix provided has invalid column dimension: Expected-#{sm_self.column_size}, Provided: #{m.column_size}")
        end
      end  
    end
    def post_addition(sm_self, m, result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        assert(result.row_size==sm_self.row_size, "Matrix returned has invalid row dimension: Expected-#{sm_self.row_size}, Result: #{result.row_size}")
        assert(result.column_size==sm_self.column_size, "Matrix returned has invalid column dimension: Expected-#{sm_self.column_size}, Result: #{result.column_size}")
        
        sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
        @matrix.each(:all){ |e| sumElementsPre1 += e }
        m.each(:all){ |e| sumElementsPre2 += e }
        result.each(:all){ |e| sumElementsPost += e }
                
        assert(sumElementsPre1 + sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} + Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}", "Addition corrupted")
      end
    end
    
    def pre_subtraction(sm_self, m)
      conditional(@@pre_symbol) do
        assert(!m.nil?, NIL_PROVIDED)     
        assert(m.respond_to?("minus") || m.respond_to?("-"), "Subtraction not supported on provided parameter") 
              
        if m.respond_to?("minus")
          assert(sm_self.row_size==m.row_size, "Matrix provided has invalid row dimension: Expected-#{sm_self.row_size}, Provided: #{m.row_size}")
          assert(sm_self.column_size==m.column_size, "Matrix provided has invalid column dimension: Expected-#{sm_self.column_size}, Provided: #{m.column_size}")
        end
      end
    end
    def post_subtraction(sm_self, m, result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        assert(result.row_size==sm_self.row_size, "Matrix returned has invalid row dimension: Expected-#{sm_self.row_size}, Result: #{result.row_size}")
        assert(result.column_size==sm_self.column_size, "Matrix returned has invalid column dimension: Expected-#{sm_self.column_size}, Result: #{result.column_size}")
              
        sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
        @matrix.each(:all){ |e| sumElementsPre1 += e }
        m.each(:all){ |e| sumElementsPre2 += e }
        result.each(:all){ |e| sumElementsPost += e }
                        
        assert(sumElementsPre1 - sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} - Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
      end     
    end  
    
    def pre_divide(sm_self, m)
      conditional(@@pre_symbol) do
        assert(!m.nil?, NIL_PROVIDED)          
        assert(m.respond_to?("divide") || m.respond_to?("/"), "Division not supported on provided parameter")
                  
        if m.respond_to?("divide")
          assert(sm_self.square?(), SELF_SQUARE)
          assert(sm_self.regular?(), SELF_REGULAR)
          assert(sm_self.row_size==m.row_size, "Matrix provided has invalid row dimension: Expected-#{sm_self.row_size}, Provided: #{m.row_size}")
          assert(sm_self.column_size==m.column_size, "Matrix provided has invalid column dimension: Expected-#{sm_self.column_size}, Provided: #{m.column_size}")
        end
      end
    end
    def post_divide(sm_self, m, result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        assert(result.row_size==sm_self.row_size, "Matrix provided has invalid row dimension: Expected-#{sm_self.row_size}, Result: #{result.row_size}")
        assert(result.column_size==sm_self.column_size, "Matrix provided has invalid column dimension: Expected-#{sm_self.column_size}, Result: #{result.column_size}")
      end
    end
    
    def pre_equals?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_equals?()
      conditional(@@post_symbol) do
        #None
      end
    end 
    
    def pre_access_ij_element(i,j)
      conditional(@@pre_symbol) do
        #None - Wrapper Checked @ Data Structure
      end
    end 
    def post_access_ij_element(result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
      end
    end
    
    def pre_set_ijk_element(i,j)
      conditional(@@pre_symbol) do
        #None - Wrapper Checked @ Data Structure
      end
    end 
    def post_set_ijk_element(result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
      end
    end
    
    def pre_coerce(m)
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_coerce(result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
      end
    end
    
    def pre_determinant(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_determinant(result)
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_empty?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_empty?(result)
      conditional(@@post_symbol) do
        #None
      end
    end
    
    #TODO
    def pre_find_index(args)
      conditional(@@pre_symbol) do
        assert(args!=nil, NIL_PROVIDED)
        assert(args.size() >=0 && args.size() < 2, "Index")
      end
    end
    
    def post_find_index(result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
      end
    end    
    
    def pre_hash()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_hash(result)
      conditional(@@post_symbol) do
        assert(result!=null,NIL_RETURNED)
      end
    end
    
    def pre_hermitian?(sm_self)
      conditional(@@pre_symbol) do
      assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_hermitian?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_inverse(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
        assert(sm_self.regular?(), SELF_REGULAR)
      end
    end
    def post_inverse(sm_self, result)
      conditional(@@post_symbol) do
        identity = sm_self.identity(sm_self.row_size())
        assert(result * sm_self == identity, "Invalid Inverse detected")
        assert(sm_self * result  == identity, "Invalid Inverse detected")
      end     
    end
    
    def pre_lower_triangular?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_lower_triangular?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_normal?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_normal?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_orthogonal?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_orthogonal?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_permutation?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_permutation?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_rank()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_rank(sm_self,result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        assert(result.to_i < [sm_self.row_size(), sm_self.column_size()].min, "Rank determined greater than max possible value.")
        assert(result.to_i >= 0, "Rank determined was less than zero.")
      end
    end
      
    def pre_regular?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_regular?(result)
      conditional(@@post_symbol) do
        #None
      end
    end
      
  def pre_round?()
    conditional(@@pre_symbol) do
      assert(sm_self.square?(), SELF_SQUARE)
    end
  end
  def post_round?(sm_self, result)
    conditional(@@post_symbol) do
      assert(!result.nil?, NIL_RETURNED)
      assert(result.row_size==sm_self.row_size, "Matrix size should not have changed during rounding.")
      assert(result.column_size==sm_self.column, "Matrix size should not have changed during rounding.")
    end
  end
    
    def pre_row_size()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_row_size(result)
      conditional(@@post_symbol) do
        assert(result!=nil, NIL_RETURNED)
        assert(result >= 0, "Row length must be greater than zero.")
        assert(result == @matrix.row_size, "Unexpected row size returned.")
      end
      
    end
    
    def pre_column_size()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_column_size(result)
      conditional(@@post_symbol) do
        assert(result!=nil, NIL_RETURNED)
        assert(result >= 0, "Row Column must be greater than zero")
        assert(result == @matrix.column_size, "Unexpected column size returned")
      end
    end
    
    def pre_singular?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_singular?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_square?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_square?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_symmetric?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_symmetric?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_to_a()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_to_a(result)
      conditional(@@post_symbol) do
        assert(result!=nil, NIL_RETURNED)
        assert(result.is_a?(Array), "Returned value must be an Array")
      end
    end
    
    def pre_to_s()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_to_s(result)
      conditional(@@post_symbol) do
        assert(result!=nil, NIL_RETURNED)
        assert(result.is_a?(String), "Returned value must be a String")
      end
    end
      
    def pre_trace(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_trace(result)
      conditional(@@post_symbol) do
        assert(result != nil, NIL_RETURNED)
      end
    end
    
    def pre_transpose()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_transpose(sm_self, result)
      conditional(@@post_symbol) do
        assert(!result.nil?, NIL_RETURNED)
        
        sumElementsPre,sumElementsPost = 0, 0
        @matrix.each(:all){ |e| sumElementsPre += e }
        result.each(:all){ |e| sumElementsPost += e }
          
        assert(sumElementsPre == sumElementsPost, "Pre: #{sumElementsPre}, Post: #{sumElementsPost}")
      end
    end
    
    def pre_unitary?(sm_self)
      conditional(@@pre_symbol) do
        assert(sm_self.square?(), SELF_SQUARE)
      end
    end
    def post_unitary?()
      conditional(@@post_symbol) do
        #None
      end
    end
    
    def pre_upper_triangular?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_upper_triangular?()
      conditional(@@post_symbol) do
        #None
      end
    end

    def pre_zero?()
      conditional(@@pre_symbol) do
        #None
      end
    end
    def post_zero?()
      conditional(@@post_symbol) do
        #None
      end
    end

    
    def class_invariant
      @@override = true
      @matrix.row_size == @delegate.row_size
      @matrix.column_size == @delegate.column_size
      
      #Mighe be able to replace size checks with this depending on how its implemented
      #@matrix == @delegate
        
      side_length_1 = self.row_size
      side_length_2 = self.column_size
      side_length_3 = rand(6)
      side_length_4 = rand(6)
      
      smatrixA = self
      smatrixB = SparseMatrix.new(:build, side_length_2,side_length_3) { rand(20) }
      smatrixC = SparseMatrix.new(:build, side_length_3,side_length_4) { rand(20) }
      
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
      smatrixB = SparseMatrix.new(:build, side_length_1,side_length_2) { rand(20) }
      smatrixC = SparseMatrix.new(:build, side_length_1,side_length_2) { rand(20) }
      
      #A + B = B + A
      assert(smatrixA + smatrixB == smatrixB + smatrixA, INVARIANT + "A + B = B + A")
      
      #(A + B)T = AT + BT
      assert((smatrixA + smatrixB).transpose() == smatrixA.transpose() + smatrixB.transpose(), INVARIANT + "(A + B)T = AT + BT")
      
      #A-B = A + -B
      assert(smatrixA - smatrixB == smatrixA + (-1 * smatrixB), INVARIANT + "A-B = A + -B")
      
      smatrixI = SparseMatrix.new(:identity, side_length_1) { rand(20) }
      #I=Rowsize*Rowsize
      #Ix = X
      assert(smatrixI * self == self, INVARIANT + "Ix = X")

      smatrixI = SparseMatrix.new(:identity, side_length_2) { rand(20) }
      #I=columnsize*columnsize
      #xI = x
      assert(self * smatrixI == self, INVARIANT + "xI = x")
      
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
    
          #A / B = A (/B)
          assert(smatrixA / smatrixB = smatrixA * (smatrixB.inverse()), INVARIANT + "A \/ B = A (\/B)")
          
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
          end 
          
        end     
      end        
      
      @@override = false
    end
end
