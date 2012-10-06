require './matrix_mod.rb'
require './sparsematrixcontracts.rb'
require 'test/unit'
require './sparsedelegatefactory.rb'

class SparseMatrix
    
    include Enumerable #Have to implement each()
    include SparseMatrixContracts

    attr_accessor :delegate
    attr_accessor :matrix
    protected :matrix

    def initialize(*rows, &block)
        pre_init(rows)
        @delegate = SparseDelegateFactory.create(*rows, &block)
        @matrix = @delegate.matrix
        post_init()
    end
      
    def *(m)
        pre_multiply(self, m)
        result = delegate_method(__method__, m)
        post_multiply(self ,m, result)
        
        result
    end
    alias multiply *
    
    def **(m)
        pre_exponential(self, m)
        result = delegate_method(__method__, m)
        post_exponential(self, m, result)
        
        result
    end
    alias exp **
    
    def +(m)
        pre_addition(self, m)
        result = delegate_method(__method__, m)
        post_addition(self, m, result)
        
        result
    end
    alias plus +
    
    def -(m)
        pre_subtraction(self, m)
        result = delegate_method(__method__, m)
        post_subtraction(self, m, result)
        
        result
    end
    alias minus -
    
    def /(m)
        pre_divide(self, m)
        result = delegate_method(__method__, m)
        post_divide(self, m, result)
        
        result
    end
    alias divide /
    
    def ==(m)
      pre_equals?()
      result = delegate_method(__method__, m)
      post_equals?()
      
      result
    end
    
    def ===(m)
      pre_equals?()
      result = delegate_method(__method__, m)
      post_equals?()
      
      result
    end
    
    def [](i,j)
      pre_access_ij_element(i,j)
      result = @matrix[i,j]
      post_access_ij_element(result)
      
      result
    end
    
    def []=(i,j,k)
      pre_set_ijk_element(i,j)
      result = @matrix.get_rows()[i,j]=k
      post_set_ijk_element(result)
      
      result
    end
       
    def coerce(m)
      pre_coerce(m)
      result = @delegate.send(__method__, m)
      post_coerce(result)
      
      result
    end
    
    def determinant
      pre_determinant(self)
      result = delegate_method(__method__)
      post_determinant(result)
      
      result
    end
    alias_method :det, :determinant
    
    def diagonal?
      pre_diagonal?(self)
      result = delegate_method(__method__)
      post_diagonal?()
      
      result
    end
    
    def eigensystem()
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
    
    def find_index(*args)
      pre_find_index(*args)
      result = delegate_method(__method__)
      post_find_index(result)
                  
      result
    end
    
    def round(ndigits=0)
      pre_round(ndigits)
      result = delegate_method(__method__)
      post_round(self, result)
                        
      result
    end
    
    def hash()
      pre_hash()
      result = delegate_method(__method__)
      post_hash(result)
            
      result
    end
    
    def hermitian?()
      pre_hermitian?(self)
      result = delegate_method(__method__)
      post_hermitian?()
      
      result
    end
    
    def inverse()
      pre_inverse(self)
      result = delegate_method(__method__)
      post_inverse(self, result)
      
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
      pre_normal?(self)
      result = delegate_method(__method__)
      post_normal?()
      
      result
    end
    
    def orthogonal?()
      pre_orthogonal?(self)
      result = delegate_method(__method__)
      post_orthogonal?()
      
      result
    end
    
    def permutation?()
      pre_permutation?(self)
      result = delegate_method(__method__)
      post_permutation?()
      
      result
    end
    
    def rank()
      pre_rank()
      result = delegate_method(__method__)
      post_rank(self, result)
      
      result
    end
    
    def regular?()
      pre_regular?(self)
      result = delegate_method(__method__)
      post_regular?(result)
      
      result
    end
    
    def row_size()
      pre_row_size()
      result = delegate_method(__method__)
      post_row_size(result)
      
      result
    end
    
  def column_size()
    pre_column_size()
    result = delegate_method(__method__)
    post_column_size(result)
    
    result
  end
    
    def singular?()
      pre_singular?(sm_self)
      result = delegate_method(__method__)
      post_singular?()
      
      result
    end
    
    def square?()
      pre_square?()
      result = delegate_method(__method__)
      post_square?()
      
      result
    end
    
    def symmetric?()
      pre_symmetric?(self)
      result = delegate_method(__method__)
      post_symmetric?()
      
      result
    end
    
    def to_a()
      pre_to_a()
      result = delegate_method(__method__)
      post_to_a(result)
      
      result
    end  
    
    def to_s()
      pre_to_s()
      result = "Sparse#{@matrix}"
      post_to_s(result)
      
      result
    end
  
    def trace()
      pre_trace(self)
      result = delegate_method(__method__)
      post_trace(result)
      
      result
    end
    
    def transpose()
      pre_transpose()
      result = delegate_method(__method__)
      post_transpose(self, result)
      
      result
    end
    
    def unitary?()
      pre_unitary?(self)
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
    
    def x()
      delegate_method(__method__)
    end
    
    def each_(*args, &block)
      #pre_each()
      result = delegate_method(__method__,*args, &block)
      #post_each()
            
      result
    end
   
    def each(which = :all, &block)
      #pre_each()
      result = @matrix.each(which, &block)
      #post_each()
            
      result
    end
    
    def delegate_method(method_name, *args, &block)
        #assert - check one of them respond or raise exception?
        #We are checking in the delegate if we respond to this method.
        #See method_missing in matrixdelegate.rb
        return @delegate.send(method_name, *args, &block)
    end
 
end
