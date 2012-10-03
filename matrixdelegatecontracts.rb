require 'test/unit'

module MatrixDelegateContracts
    
    include Test::Unit::Assertions

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

    def pre_identity(n)
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
    
    def class_invariant
    end
end
