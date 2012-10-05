require './matrix_mod.rb'
require './sparsematrixcontracts.rb'
require 'test/unit'
require './sparsedelegatefactory.rb'

class SparseMatrix

    include SparseMatrixContracts

    attr_accessor :delegate
    attr_accessor :matrix
    protected :matrix
    
    def delegate(method_name, *args)
    end

    def initialize(rows, type=nil)
        @delegate = SparseDelegateFactory.create(rows)
        @matrix = @delegate.matrix
    end

    def *(m)
        pre_multiply(m)
        result = delegate_method(__method__, m)
        post_multiply(m)
        
        result
    end
    
    def **(m)
        pre_exponential(m)
        result = delegate_method(__method__, m)
        post_exponential(m)
        
        result
    end
    
    def +(m)
        pre_addition(m)
        result = delegate_method(__method__, m)
        post_addition(m)
        
        result
    end
    
    def -(m)
        pre_subtraction(m)
        result = delegate_method(__method__, m)
        post_subtraction(m)
        
        result
    end
    
    def /(m)
        pre_divide(m)
        result = delegate_method(__method__, m)
        post_divide(m)
        
        result
    end
    
    def ==(m)
      pre_divide(m)
      result = delegate_method(__method__, m)
      post_divide(m)
      
      result
    end
    
    def [](i,j)
      pre_access_ij_element(m)
      result = delegate_method(__method__, m)
      post_divide(m)
      
      result
    end
    
       
    def coerce(m)
      pre_coerce(m)
      result = delegate(__method__, m)
      post_coerce(m)
      
      result
    end
    
    def determinant
      pre_determinant()
      result = delegate_method(__method__)
      post_determinant(result)
      
      result
    end
    
    def eigensystem
      pre_eigensystem()
      result = delegate_method(__method__)
      post_eigensystem(result)
      
      result
    end
    
    def empty?
      pre_empty?()
      result = delegate_method(__method__)
      post_empty?()
            
      result
    end
    
    def hash()
      pre_hash()
      result = delegate_method(__method__)
      post_hash(result)
            
      result
    end
    
    def hermitian?()
      pre_hermitian?()
      result = delegate_method(__method__)
      post_hermitian?()
      
      result
    end
    
    def inverse()
      pre_inverse()
      result = delegate_method(__method__)
      post_inverse()
      
      result
    end
    
    def lower_triangular?()
      pre_lower_triangular?()
      result = delegate_method(__method__)
      post_lower_triangular?()
            
      result
    end
    
    def lup()
      pre_lup()
      result = delegate_method(__method__)
      post_lup()
      
      result
    end
    
    def normal?()
      pre_normal?()
      result = delegate_method(__method__)
      post_normal?()
      
      result
    end
    
    def orthogonal?()
      pre_orthogonal()
      result = delegate_method(__method__)
      post_orthogonal()
      
      result
    end
    
    def permutation?()
      pre_permutation()
      result = delegate_method(__method__)
      post_permutation()
      
      result
    end
    
    def rank()
      pre_rank()
      result = delegate_method(__method__)
      post_rank(result)
      
      result
    end
    
    def regular?()
      pre_regular?()
      result = delegate_method(__method__)
      post_regular?(result)
      
      result
    end
    
    def row_size()
      pre_row_size()
      result = delegate_method(__method__)
      post_row_size()
      
      result
    end
    
    def singular?()
      pre_singular?()
      result = delegate_method(__method__)
      post_singular?()
      
      result
    end
    
    def square?()
      pre_square()
      result = delegate_method(__method__)
      post_square()
      
      result
    end
    
    def symmetric?()
      pre_symmetric?()
      result = delegate_method(__method__)
      post_symmetric?()
      
      result
    end
    
    def to_a()
      pre_to_a()
      result = delegate_method(__method__)
      post_to_a()
      
      result
    end
    
    
    
    def to_s()
      pre_to_s()
      result = "Sparse#{@matrix}"
      post_to_s()
      
      result
    end
  
    def trace()
      pre_trace()
      result = delegate_method(__method__)
      post_trace()
      
      result
    end
    
    def transpose()
      pre_transpose()
      result = delegate_method(__method__)
      post_transpose()
      
      result
    end
    
    def unitary?()
      pre_unitary?()
      result = delegate_method(__method__)
      post_unitary?()
      
      result
    end
    
    def upper_triangular?()
      pre_upper_triangular?()
      result = delegate_method(__method__)
      post_upper_triangular?()
            
      result
    end
    
    def zero?()
      pre_zero?()
      result = delegate_method(__method__)
      post_zero?()
            
      result
    end
    
    def delegate_method(method_name, *args) 
        #assert - check one of them respond or raise exception?
        #We are checking in the delegate if we respond to this method.
        #See method_missing in matrixdelegate.rb
        return @delegate.send(method_name, *args)
    end
    
end
