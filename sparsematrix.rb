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

    def to_s
        "Sparse#{@matrix}"
    end

    def self.[](delegate, *rows)
        #pre-conditions
        self.init_matrix(delegate, __method__, *rows)
        #post-conditions
    end

    def self.diagonal(delegate, *values)
        #pre-conditions
        self.init_matrix(delegate, __method__, *values)
        #post-conditions
    end

    def self.empty(delegate, row_size = 0, col_size = 0)
        #pre-conditions
        self.init_matrix(delegate, __method__, row_size, col_size)
        #post-conditions
    end
    
    def self.rows(delegate, rows, copy = true)
        #pre-conditions
        self.init_matrix(delegate, __method__, rows, copy)
        #post-conditions
    end

    def self.columns(delegate, columns)
        #pre-conditions
        self.init_matrix(delegate, __method__, columns)
        #post-conditions
    end

    def self.build(delegate, rowSize, columnSize = rowSize)
        #pre-conditions
        self.init_matrix(delegate, __method__, rowSize, columnSize)
        #post-conditions
    end

    def self.scalar(delegate, n, value)
        #pre-conditions
        self.init_matrix(delegate, __method__, n, value)
        #post-conditions
    end

    def self.identity(delegate, n)
        #pre-conditions
        self.init_matrix(delegate, __method__, n)
        #post-conditions
    end

    def self.unit(delegate, n)
        #pre-conditions
        self.init_matrix(delegate, __method__, n)
        #post-conditions
    end

    def self.I(delegate, n)
        #pre-conditions
        self.init_matrix(delegate, __method__, n)
        #post-conditions
    end

    def self.zero(delegate, n)
        #pre-conditions
        self.init_matrix(delegate, __method__, n)
        #post-conditions
    end

    def self.row_vector(delegate, row)
        #pre-conditions
        self.init_matrix(delegate, __method__, row)
        #post-conditions
    end

    def self.column_vector(delegate, column)
        #pre-conditions
        self.init_matrix(delegate, __method__, column)
        #post-conditions
    end
      
    def *(m)
        #pre-conditions
        return delegate_method(__method__, m)
        #post-conditions
    end
    
    
    
    def coerce(matrix)
      delegate(__method__, matrix)
    end

    #other methods here
    
    private
  
    def self.init_matrix(delegate, method_name, *args)
        #pre-conditions
        #method name is string and args are the right number of args
        matrix = self.delegate_init(delegate, method_name, *args)
        new delegate, matrix
        #post conditions are @matrix contains a matrix
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
