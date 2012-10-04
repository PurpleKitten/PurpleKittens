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

    def pre_empty(rowSize, colSize)
    end
    def post_empty(rowSize, colSize)
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
    def post_identity(n)
    end

    def pre_unit(n)
    end
    def post_unit(n)
    end

    def pre_I(n)
    end
    def post_I(n)
    end

    def pre_zero(n)
    end
    def post_zero(n)
    end

    def pre_row_vector(row)
    end
    def post_row_vector(row)
    end

    def pre_column_vector(column)
    end
    def post_column_vector(column)
    end
    
    def pre_multiply(m)
    end
    def post_multiply(m)
    end
    
    def pre_exponential(m)
    end
    def post_exponential(m)
    end
    
    def pre_addition(m)
    end
    def post_addition(m)
    end
    
    def pre_subtraction(m)
    end
    def post_subtraction(m)
    end  
    
    def pre_divide(m)
    end
    def post_divide(m)
    end
    
    def pre_equal(m)
    end
    def post_equal(m)
    end 
    
    def pre_access_ij_element(m)
    end 
    def post_access_ij_element(m)
    end
    
    def pre_coerce(m)
    end
    def post_coerce(m)
    end
    
    def pre_determinant()
    end
    def post_determinant(result)
    end
    
    def pre_eigensystem()
    end
    def post_eigensystem(result)
    end
    
    def pre_empty?()
    end
    def post_empty?(result)
    end
    
    def pre_hash()
    end
    def post_hash()
    end
    
    def pre_hermitian?()
    end
    def post_hermitian?()
    end
    
    def pre_inverse()
    end
    def post_inverse()
    end
    
    def pre_lower_triangular?()
    end
    def post_lower_triangular?()
    end
    
    def pre_lup()
    end
    def post_lup()
    end
    
    def pre_normal?()
    end
    def post_normal?()
    end
    
    def pre_orthogonal()
    end
    def post_orthogonal()
    end
    
    def pre_permutation?()
    end
    def post_permutation?()
    end
    
    def pre_rank()
    end
    def post_rank(result)
    end
      
    def pre_regular?()
    end
    def post_regular?(result)
    end
    
    def pre_row_size()
    end
    def post_row_size()
    end
    
    def pre_singular?()
    end
    def post_singular?()
    end
    
    def pre_sqaure()
    end
    def post_square()
    end
    
    def pre_symmetric?()
    end
    def post_symmetric?()
    end
    
    def pre_to_a()
    end
    def post_to_a()
    end
    
    def pre_to_s()
    end
    def post_to_s()
    end
      
    def pre_trace()
    end
    def post_trace()
    end
    
    def pre_transpose()
    end
    def post_transpose()
    end
    
    def pre_unitary?()
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

    
    def class_invariant
    end
end
