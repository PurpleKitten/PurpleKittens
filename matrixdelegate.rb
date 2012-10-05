require './matrixdelegatecontracts.rb'

module MatrixDelegate

    include MatrixDelegateContracts

    class << self
        attr_accessor :matrix
        private :matrix
    end
    
     
    def initialize()
        @matrix = nil
    end
    private:initialize
    
    def method_missing(method_name, *args)
        puts method_name
        #pre_method_missing(delegate, method_name, *args)
        class_invariant

        if self.respond_to?(method_name)
            result = self.send(method_name, *args)
        else
            result = @matrix.send(method_name, *args)
        end    

        class_invariant
        post_method_missing(method_name, *args)
        
        result
    end
  

    def [](*rows)
        pre_square_brackets(rows)
        class_invariant()

        mat = create_matrix(__method__, *rows)
        
        class_invariant()
        post_square_brackets(rows)
        mat
    end
 
    def diagonal(*values)
        pre_diagonal(values)
        class_invariant()

        mat = create_matrix(__method__, *values)
        
        class_invariant()
        post_diagonal(values)
        mat
    end 
    
    def empty(row_size = 0, col_size = 0)
        pre_empty(row_size, col_size)
        class_invariant()

        mat = create_matrix(__method__, row_size, col_size)
        
        class_invariant()
        post_empty(row_size, col_size)
        mat
    end
    
    def rows(rows, copy = true)
        pre_rows(rows, copy)
        class_invariant()

        mat = create_matrix(__method__, rows, copy)
        
        class_invariant()
        post_rows(rows, copy)
        mat
    end    

    def columns(columns)
        pre_columns(columns)
        class_invariant()

      mat = create_matrix(__method__, columns)
        
        class_invariant()
        post_columns(columns)
        mat
    end

    def build(rowSize, columnSize = rowSize)
        pre_build(rowSize, columnSize)
        class_invariant()

        mat = create_matrix(__method__, rowSize, columnSize)
        
        class_invariant()
        post_build(rowSize, columnSize)
        mat
    end

    def scalar(n, value)
        pre_scalar(n, value)
        class_invariant()

        mat = create_matrix(__method__, n, value)
        
        class_invariant()
        post_scalar(n, value)
        mat
    end

    def identity(n)
        pre_identity(n)
        class_invariant()

        mat = create_matrix(__method__, n)
        
        class_invariant()
        post_identity(n)
        mat
    end

    def unit(n)
        pre_unit(n)
        class_invariant()

        mat = create_matrix(__method__, n)
        
        class_invariant()
        post_unit(n)
        mat
    end

    def I(n)
        pre_I(n)
        class_invariant()

        mat = create_matrix(__method__, n)
        
        class_invariant()
        post_I(n)
        mat
    end

    def zero(n)
        pre_zero(n)
        class_invariant()

        mat = create_matrix(__method__, n)
        
        class_invariant()
        post_zero(n)
        mat
    end

    def row_vector(row)
        pre_row_vector(row)
        class_invariant()

        mat = create_matrix(__method__, row)
        
        class_invariant()
        post_row_vector(row)
        mat
    end

    def column_vector(column)
        pre_column_vector(column)
        class_invariant()

        mat = create_matrix(__method__, column)
        
        class_invariant()
        post_column_vector(column)
        mat
    end
    
    def coerce(obj)      
      return [obj, @matrix]
    end 
    
end
