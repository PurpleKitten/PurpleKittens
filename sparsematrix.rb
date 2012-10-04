require './matrix_mod.rb'
require './sparsematrixcontracts.rb'
require 'test/unit'

class SparseMatrix

    include SparseMatrixContracts

    attr_accessor :delegate
    attr_accessor :matrix
    protected :matrix
    
    def delegate(method_name, *args)
        return @delegate.send(method_name, *args)
    end

    def initialize(delegate,matrix)
        @delegate = delegate
        @matrix = matrix
    end
    private :initialize

    def self.[](delegate, *rows)
        #pre_square_brackets(rows)
        result = self.init_matrix(delegate, __method__, *rows)
        #post_square_brackets(rows)
        
        result
    end

    def self.diagonal(delegate, *values)
       # pre_diagonal(values)
        result = self.init_matrix(delegate, __method__, *values)
       # post_diagonal(values)

        result
    end

    def self.empty(delegate, row_size = 0, col_size = 0)
       # pre_empty(rowSize, colSize)
        result = self.init_matrix(delegate, __method__, row_size, col_size)
        #post_empty(rowSize, colSize)
        
        result
    end
    
    def self.rows(delegate, copy = true, *rows)
       # pre_rows(rows, copy)
        result = self.init_matrix(delegate, __method__, copy, *rows)
       # post_rows(rows, copy)
        
        result
    end

    def self.columns(delegate, columns)
      #  pre_columns(columns)
        result = self.init_matrix(delegate, __method__, columns)
      #  post_columns(columns)
        
        result
    end

    def self.build(delegate, rowSize, columnSize = rowSize)
       # pre_build(rowSize, colSize)
        result = self.init_matrix(delegate, __method__, rowSize, columnSize)
       # post_build(rowSize, colSize)
        
        result
    end

    def self.scalar(delegate, n, value)
       # pre_scalar(n, value)
        result = self.init_matrix(delegate, __method__, n, value)
       # post_scalar(n, value)
        
        result
    end

    def self.identity(delegate, n)
        #SparseMatrixContracts.pre_identity(n)
        result = self.init_matrix(delegate, __method__, n)
       # post_identity(n)
        
        result
    end

    def self.unit(delegate, n)
     #   pre_unit(n)
        result = self.init_matrix(delegate, __method__, n)
      #  post_unit(n)
        
        result
    end

    def self.I(delegate, n)
      #  pre_I(n)
        result = self.init_matrix(delegate, __method__, n)
      #  post_I(n)
        
        result
    end

    def self.zero(delegate, n)
      #  pre_zero(n)
        result = self.init_matrix(delegate, __method__, n)
      #  post_zero(n)
        
        result
    end

    def self.row_vector(delegate, row)
      #  pre_row_vector(row)
        result = self.init_matrix(delegate, __method__, row)
       # post_row_vector(row)
        
        result
    end

    def self.column_vector(delegate, column)
      #  pre_column_vector(column)
        result = self.init_matrix(delegate, __method__, column)
      #  post_column_vector(column)
        
        result
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
      result = delegate(__method__)
      post_determinant(result)
      
      result
    end
    
    def eigensystem
      pre_eigensystem()
      result = delegate(__method__)
      post_eigensystem(result)
      
      result
    end
    
    def empty?
      pre_empty?()
      result = delegate(__method__)
      post_empty?(result)
            
      result
    end
    
    def hash()
      pre_hash()
      result = delegate(__method__)
      post_hash(result)
            
      result
    end
    
    def hermitian?()
      pre_hermitian?()
      result = delegate(__method__)
      post_hermitian?(result)
      
      result
    end
    
    def inverse()
      pre_inverse()
      result = delegate(__method__)
      post_inverse(result)
      
      result
    end
    
    def lower_triangular?()
      pre_lower_triangular?()
      result = delegate(__method__)
      post_lower_triangular?(result)
            
      result
    end
    
    def lup()
      pre_lup()
      result = delegate(__method__)
      post_lup()
      
      result
    end
    
    def normal?()
      pre_normal?()
      result = delegate(__method__)
      post_normal?()
      
      result
    end
    
    def orthogonal?()
      pre_orthogonal()
      result = delegate(__method__)
      post_orthogonal()
      
      result
    end
    
    def permutation?()
      pre_permutation()
      result = delegate(__method__)
      post_permutation()
      
      result
    end
    
    def rank()
      pre_rank()
      result = delegate(__method__)
      post_rank(result)
      
      result
    end
    
    def regular?()
      pre_regular?()
      result = delegate(__method__)
      post_regular?(result)
      
      result
    end
    
    def row_size()
      pre_row_size()
      result = delegate(__method__)
      post_row_size()
      
      result
    end
    
    def singular?()
      pre_singular?()
      result = delegate(__method__)
      post_singular?()
      
      result
    end
    
    def square?()
      pre_square()
      result = delegate(__method__)
      post_square()
      
      result
    end
    
    def symmetric?()
      pre_symmetric?()
      result = delegate(__method__)
      post_symmetric?()
      
      result
    end
    
    def to_a()
      pre_to_a()
      result = delegate(__method__)
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
      result = delegate(__method__)
      post_trace()
      
      result
    end
    
    def transpose()
      pre_transpose()
      result = delegate(__method__)
      post_transpose()
      
      result
    end
    
    def unitary?()
      pre_unitary?()
      result = delegate(__method__)
      post_unitary?()
      
      result
    end
    
    def upper_triangular?()
      pre_upper_triangular?()
      result = delegate(__method__)
      post_upper_triangular?()
            
      result
    end
    
    def zero?()
      pre_zero?()
      result = delegate(__method__)
      post_zero?()
            
      result
    end
    
    
    
    
    #other methods here
    
    private
  
    def self.init_matrix(delegate, method_name, *args)
        
        #pre_init_matrix(delegate, method_name, args)
      
        matrix = self.delegate_init(delegate, method_name, *args)
        result = new delegate, matrix
        
        #post_init_matrix(delegate, method_name, args)
        
        result
    end
  
  
    def delegate_method(method_name, *args) 
      #assert - check one of them respond or raise exception?
      
          if @delegate.respond_to?(method_name)
              return @delegate.send(method_name, *args)
          else
              return @matrix.send(method_name, *args)
        
      end
    end
    
    def self.delegate_init(delegate, method_name, *args)  
       
      if delegate.respond_to?(method_name)
            return delegate.send(method_name, *args)
        else
            return Matrix.send(method_name, *args)
        end 
  end
    
end
