require './matrix_mod.rb'
require './sparsematrixcontracts.rb'
require 'test/unit'

class SparseMatrix

    include SparseMatrixContracts

    attr_accessor :delegate
    attr_accessor :matrix
    protected :matrix

    def self.delegate(method_name, *args)
        if @delegate.respond_to?(method_name)
            @delegate.send(method_name, *args)
        else
            Matrix.send(method_name, *args)
        end 
    end
    
    def method_missing(method_name, *args)
        if @delegate.respond_to?(method_name)
            @delegate.send(method_name, *args)
        else
            @matrix.send(method_name, *args)
        end
    end

    private
    def initialize(delegate,matrix)
        @delegate = delegate
        @matrix = matrix
    end

    def self.init_matrix(delegate, method_name, *args)
        #pre-conditions
        #method name is string and args are the right number of args
        matrix = delegate(method_name, *args)
        new delegate, matrix
        #post conditions are @matrix contains a matrix
    end

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

    #other methods here

end
