require 'test/unit'

module SparseMatrixContracts
    
    include Test::Unit::Assertions

    def pre_init_matrix(delegate, method_name, args)
    end
    def post_init_matrix(delegate, method_name, args)
    end

    def pre_square_brackets(rows)
    end
    def post_square_brackets(rows)
    end

    def pre_diagonal(values)
    end
    def post_diagonal(values)
    end
    
    def pre_diagonal?(sm_self)
      assert(sm_self.square?())
    end
    def post_diagonal?()
      #None
    end

    def pre_empty(rowSize, colSize)
    end
    def post_empty(rowSize, colSize)
    end
    
    def pre_empty?()
      #None
    end
    def post_empty?()
      #None
    end

    def pre_rows(rows, copy)
    end
    def post_rows(rows, copy)
    end

    def pre_columns(columns)
    end
    def post_columns(columns)
    end

    def pre_build(rowSize, colSize)
    end
    def post_build(rowSize, colSize)
    end

    def pre_scalar(n, value)
    end
    def post_scalar(n, value)
    end

    def SparseMatrixContracts.pre_identity(n)
    end
    def SparseMatrixContracts.post_identity(n)
    end

    def pre_zero(n)
    end
    def post_zero(n)
    end
    
    def pre_multiply(sm_self,m)
      assert(!m.nil?)     
      assert(m.respond_to?("multiply") || m.respond_to?("*"))
      
      if(m.respond_to?("multiply"))
        assert(sm_self.column_size==m.row_size)
      end
        
    end
    def post_multiply(sm_self,m, result)
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
    end
    def post_exponential(sm_self, m, result)
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
    end
    def post_addition(sm_self, m, result)
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
    end
    def post_subtraction(sm_self, m, result)
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
    end
    def post_divide(sm_self, m, result)
      assert(!result.nil?)
      assert(result.row_size==sm_self.row_size)
      assert(result.column_size==sm_self.column_size)
    end
    
    def pre_equal()
      #None
    end
    def post_equal()
      #None
    end 
    
    def pre_access_ij_element(i,j)
      #None - Wrapper Checked @ Data Structure
    end 
    def post_access_ij_element(result)
      assert(!result.nil?)
    end
    
    def pre_set_ijk_element(i,j)
      #None - Wrapper Checked @ Data Structure
    end 
    def post_set_ijk_element(result)
      assert(!result.nil?)
    end
    
    def pre_coerce(m)
      #None
    end
    def post_coerce(result)
      assert(!result.nil?)
    end
    
    def pre_determinant(sm_self)
      assert(sm_self.square?())
    end
    def post_determinant(result)
    end
    
    def pre_eigensystem()
      
    end
    def post_eigensystem(result)
    end
    
    def pre_empty?()
      #None
    end
    def post_empty?(result)
      #None
    end
    
    def pre_find_index(args)
      assert(args.size() >=0 && args.size() < 2)
    end
    
    def post_find_index(result)
      assert(!result.nil?)
    end    
    
    def pre_hash()
      #None
    end
    def post_hash(result)
      assert(result!=null)
    end
    
    def pre_hermitian?(sm_self)
      assert(sm_self.square?())
    end
    def post_hermitian?()
      #None
    end
    
    def pre_inverse(sm_self)
      assert(sm_self.square?())
      assert(sm_self.regular?())
    end
    def post_inverse(sm_self, result)
      identity = sm_self.identity(sm_self.row_size())
      assert(result * sm_self == identity)
      assert(sm_self * result  == identity)     
    end
    
    def pre_lower_triangular?()
      #None
    end
    def post_lower_triangular?()
      #None
    end
    
    def pre_lup()
    end
    def post_lup()
    end
    
    def pre_normal?(sm_self)
      assert(sm_self.square?())
    end
    def post_normal?()
      #None
    end
    
    def pre_orthogonal?(sm_self)
      assert(sm_self.square?())
    end
    def post_orthogonal?()
      #None
    end
    
    def pre_permutation?(sm_self)
      assert(sm_self.square?())
    end
    def post_permutation?()
      #None
    end
    
    def pre_rank()
      #None
    end
    def post_rank(sm_self,result)
      assert(result.to_i < [sm_self.row_size(), sm_self.column_size()].min)
      assert(result.to_i >= 0)
    end
      
    def pre_regular?(sm_self)
      assert(sm_self.square?())
    end
    def post_regular?(result)
      #None
    end
      
  def pre_round?()
    assert(sm_self.square?())
  end
  def post_round?(sm_self, result)
    assert(!result.nil?)
    assert(result.row_size==sm_self.row_size)
    assert(result.column_size==sm_self.column)
  end
    
    def pre_row_size()
      #None - Delegated
    end
    def post_row_size(result)
      assert(result!=nil)
      assert(result >= 0)
      assert(result == @matrix.row_size)
      
    end
    
    def pre_column_size()
      #None
    end
    def post_column_size(result)
      assert(result!=nil)
      assert(result >= 0)
      assert(result == @matrix.column_size)
      
    end
    
    def pre_singular?(sm_self)
      assert(sm_self.square?())
    end
    def post_singular?()
      #None
    end
    
    def pre_square?()
      #None
    end
    def post_square?()
      #None
    end
    
    def pre_symmetric?(sm_self)
      assert(sm_self.square?())
    end
    def post_symmetric?()
      
    end
    
    def pre_to_a()
      #None
    end
    def post_to_a(result)
      assert(result!=nil)
      assert(result.is_a?(Array))
    end
    
    def pre_to_s()
      #None
    end
    def post_to_s(result)
      assert(result!=nil)
      assert(result.is_a?(String))
    end
      
    def pre_trace(sm_self)
      assert(sm_self.square?())
    end
    def post_trace(result)
      assert(result != nil)
    end
    
    def pre_transpose()
    end
    def post_transpose(sm_self, result)
      assert(!result.nil?)
      
      sumElementsPre,sumElementsPost = 0, 0
      @matrix.each(:all){ |e| sumElementsPre += e }
      result.each(:all){ |e| sumElementsPost += e }
        
      assert(sumElementsPre == sumElementsPost, "Pre: #{sumElementsPre}, Post: #{sumElementsPost}")
    end
    
    def pre_unitary?(sm_self)
      assert(sm_self.square?())
    end
    def post_unitary?()
      #None
    end
    
    def pre_upper_triangular?()
      #None
    end
    def post_upper_triangular?()
      #None
    end

    def pre_zero?()
      #None
    end
    def post_zero?()
      #None
    end

    
    def class_invariant
    end
end
