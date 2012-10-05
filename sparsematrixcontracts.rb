require 'test/unit'

module SparseMatrixContracts
    
    include Test::Unit::Assertions

    def pre_init(rows)
        assert(!rows.nil?, 'Rows must not be nil!')
        assert(rows.is_a?(Array), 'Input rows must be an array.')

    end
    def post_init(rows)
        assert(rows == self.to_a, 'Matrix not initialized properly.')
    end

    def pre_diagonal?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_diagonal?()
      class_invariant
      #None
    end
    
    def pre_empty?()
      #None
      class_invariant
    end
    def post_empty?()
      class_invariant
      #None
    end

    def pre_multiply(sm_self,m)
      assert(!m.nil?)     
      assert(m.respond_to?("multiply") || m.respond_to?("*"))
      
      if(m.respond_to?("multiply"))
        assert(sm_self.column_size==m.row_size)
      end
      
      class_invariant  
    end
    def post_multiply(sm_self,m, result)
      class_invariant
      assert(!result.nil?)
      assert(result.row_size==sm_self.row_size)
      assert(result.column_size==sm_self.column_size)
    end
    
    def pre_exponential(sm_self, m)
      assert(!m.nil?)     
      assert(m.is_a?(Integer))
      assert(sm_self.square?())
          
      if(m <= 0)
        assert(sm_self.regular?())
      end
      class_invariant
      
    end
    def post_exponential(sm_self, m, result)
      class_invariant
      assert(!result.nil?)
      assert(sm_self.row_size==result.row_size)
      assert(sm_self.column_size==result.column_size)
      
    end
    
    def pre_addition(sm_self, m)
      assert(!m.nil?)     
      assert(m.respond_to?("plus") || m.respond_to?("+")) 
      
      if m.respond_to?("plus")
        assert(sm_self.row_size==m.row_size)
        assert(sm_self.column_size==m.column_size)
      end
      class_invariant  
    end
    def post_addition(sm_self, m, result)
      class_invariant
      assert(!result.nil?)
      assert(result.row_size==sm_self.row_size)
      assert(result.column_size==sm_self.column_size)
      
      sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
      @matrix.each(:all){ |e| sumElementsPre1 += e }
      m.each(:all){ |e| sumElementsPre2 += e }
      result.each(:all){ |e| sumElementsPost += e }
              
      assert(sumElementsPre1 + sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} + Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
      
    end
    
    def pre_subtraction(sm_self, m)
      assert(!m.nil?)     
      assert(m.respond_to?("minus") || m.respond_to?("-")) 
            
      if m.respond_to?("minus")
        assert(sm_self.row_size==m.row_size)
        assert(sm_self.column_size==m.column_size)
      end
      class_invariant
    end
    def post_subtraction(sm_self, m, result)
      class_invariant
      assert(!result.nil?)
      assert(result.row_size==sm_self.row_size)
      assert(result.column_size==sm_self.column_size)
            
      sumElementsPre1,sumElementsPre2,sumElementsPost = 0, 0, 0
      @matrix.each(:all){ |e| sumElementsPre1 += e }
      m.each(:all){ |e| sumElementsPre2 += e }
      result.each(:all){ |e| sumElementsPost += e }
                      
      assert(sumElementsPre1 - sumElementsPre2 == sumElementsPost, "Pre1 #{sumElementsPre1} - Pre2 #{sumElementsPre2} = Result: #{sumElementsPost}")
            
    end  
    
    def pre_divide(sm_self, m)
      assert(!m.nil?)          
      assert(m.respond_to?("divide") || m.respond_to?("/"))
                
      if m.respond_to?("divide")
        assert(sm_self.square?())
        assert(sm_self.regular?())
        assert(sm_self.row_size==m.row_size)
        assert(sm_self.column_size==m.column_size)
      end
      
      class_invariant
    end
    def post_divide(sm_self, m, result)
      class_invariant
      assert(!result.nil?)
      assert(result.row_size==sm_self.row_size)
      assert(result.column_size==sm_self.column_size)
    end
    
    def pre_equals?()
      #None
      class_invariant
    end
    def post_equals?()
      class_invariant
      #None
    end 
    
    def pre_access_ij_element(i,j)
      #None - Wrapper Checked @ Data Structure
      class_invariant
    end 
    def post_access_ij_element(result)
      class_invariant
      assert(!result.nil?)
    end
    
    def pre_set_ijk_element(i,j)
      #None - Wrapper Checked @ Data Structure
      class_invariant
    end 
    def post_set_ijk_element(result)
      class_invariant
      assert(!result.nil?)
    end
    
    def pre_coerce(m)
      #None
      class_invariant
    end
    def post_coerce(result)
      class_invariant
      assert(!result.nil?)
    end
    
    def pre_determinant(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_determinant(result)
      class_invariant
    end
    
    def pre_empty?()
      #None
      class_invariant
    end
    def post_empty?(result)
      class_invariant
      #None
    end
    
    def pre_find_index(args)
      assert(args.size() >=0 && args.size() < 2)
      class_invariant
    end
    
    def post_find_index(result)
      class_invariant
      assert(!result.nil?)
    end    
    
    def pre_hash()
      class_invariant
      #None
    end
    def post_hash(result)
      class_invariant
      assert(result!=null)
    end
    
    def pre_hermitian?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_hermitian?()
      class_invariant
      #None
    end
    
    def pre_inverse(sm_self)
      assert(sm_self.square?())
      assert(sm_self.regular?())
      class_invariant
    end
    def post_inverse(sm_self, result)
      class_invariant
      identity = sm_self.identity(sm_self.row_size())
      assert(result * sm_self == identity)
      assert(sm_self * result  == identity)     
    end
    
    def pre_lower_triangular?()
      #None
      class_invariant
    end
    def post_lower_triangular?()
      class_invariant
      #None
    end
    
    def pre_normal?(sm_self)
      class_invariant
      assert(sm_self.square?())
    end
    def post_normal?()
      #None
      class_invariant
    end
    
    def pre_orthogonal?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_orthogonal?()
      class_invariant
      #None
      
    end
    
    def pre_permutation?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_permutation?()
      #None
      class_invariant
    end
    
    def pre_rank()
      #None
      class_invariant
    end
    def post_rank(sm_self,result)
      class_invariant
      assert(result.to_i < [sm_self.row_size(), sm_self.column_size()].min)
      assert(result.to_i >= 0)
    end
      
    def pre_regular?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_regular?(result)
      class_invariant
      #None
    end
      
  def pre_round?()
    assert(sm_self.square?())
    class_invariant
  end
  def post_round?(sm_self, result)
    class_invariant
    assert(!result.nil?)
    assert(result.row_size==sm_self.row_size)
    assert(result.column_size==sm_self.column)
  end
    
    def pre_row_size()
      #None
      class_invariant
    end
    def post_row_size(result)
      class_invariant
      assert(result!=nil)
      assert(result >= 0)
      assert(result == @matrix.row_size)
      
    end
    
    def pre_column_size()
      #None
      class_invariant
    end
    def post_column_size(result)
      class_invariant
      assert(result!=nil)
      assert(result >= 0)
      assert(result == @matrix.column_size)
      
    end
    
    def pre_singular?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_singular?()
      class_invariant
      #None
    end
    
    def pre_square?()
      #None
      class_invariant
    end
    def post_square?()
      class_invariant
      #None
    end
    
    def pre_symmetric?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_symmetric?()
      class_invariant
    end
    
    def pre_to_a()
      #None
      class_invariant
    end
    def post_to_a(result)
      class_invariant
      assert(result!=nil)
      assert(result.is_a?(Array))
    end
    
    def pre_to_s()
      #None
      class_invariant
    end
    def post_to_s(result)
      class_invariant
      assert(result!=nil)
      assert(result.is_a?(String))
    end
      
    def pre_trace(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_trace(result)
      class_invariant
      assert(result != nil)
    end
    
    def pre_transpose()
      #None
      class_invariant
    end
    def post_transpose(sm_self, result)
      class_invariant
      assert(!result.nil?)
      
      sumElementsPre,sumElementsPost = 0, 0
      @matrix.each(:all){ |e| sumElementsPre += e }
      result.each(:all){ |e| sumElementsPost += e }
        
      assert(sumElementsPre == sumElementsPost, "Pre: #{sumElementsPre}, Post: #{sumElementsPost}")
    end
    
    def pre_unitary?(sm_self)
      assert(sm_self.square?())
      class_invariant
    end
    def post_unitary?()
      class_invariant
      #None
    end
    
    def pre_upper_triangular?()
      #None
      class_invariant
    end
    def post_upper_triangular?()
      class_invariant
      #None
    end

    def pre_zero?()
      #None
      class_invariant
    end
    def post_zero?()
      class_invariant
      #None
    end

    
    def class_invariant
      @matrix.row_size == @delegate.row_size
      @matrix.column_size == @delegate.column_size
      
      #Mighe be able to replace size checks with this depending on how its implemented
      #@matrix == @delegate
      
      #A(BC)=(AB)C
      #(A+B)C=AC+BC
      #a(BC)=(aB)C
      #(AB)a=A(B)a
      #A + B = B + A
      #(A + B)T = AT + BT
      #(AB)T = B^T*A^T
      #(A+B)^T = A^T+B^T
      #trace(A)=trace(A^T)
      #trace(A+B)=trace(A) + trace(B)
      
      #rank [A] = rank(A^T*A)= rank(A*A^T)
      
      #I=Rowsize*Rowsize
      #Ix = X

      #I=columnsize*columnsize
      #xI = x
      
      #determinant
      #det(EA)=det(E)det(A)
      
      #determinant & inverse
      #det A^-1 = 1 / detA
      
      
      #If Inverse:
      #(A^T)^-1 =(A^-1)^T 
      #(AB)^-1 = B^-1*A^-1
      
    end
end
