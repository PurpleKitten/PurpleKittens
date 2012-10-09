require_relative '../contracts/matrixdelegatecontracts'
require_relative '../datastructures/matrixdatastructure'

module MatrixDelegate

    include MatrixDelegateContracts

    attr_reader :matrix

    def create_matrix(matrix)
        pre_create_matrix(matrix)
        class_invariant

        @matrix = matrix
        @matrixData = MatrixDataStructure.send(@dataStructure, @matrix.to_a)
        @matrix.replace_matrix_structure(@matrixData)

        class_invariant
        post_create_matrix(@matrix)
        @matrix
    end


    def method_missing(method_name, *args)
        pre_method_missing(method_name, *args)
        class_invariant

        if self.respond_to?(method_name.to_s)
            result = self.send(method_name.to_s, *args)
        else
            result = @matrix.send(method_name.to_s, *args)
        end    

        class_invariant
        post_method_missing(method_name, *args)

        result
    end

    def coerce(obj)
        pre_coerce()
        class_invariant

        result = [obj, @matrix]

        post_coerce(result)
        class_invariant
        result
    end

    private
    def scalar_operation(&block)
        pre_scalar_operation(&block)
        result_matrix = self.to_a
        @matrixData.each_with_index do |row, i|
            row.each_with_index do |col, j|
                result_matrix[i][j] = yield(col).to_i
            end
        end
        result_matrix = SparseMatrix.new(result_matrix)

        post_scalar_operation(result_matrix)               
        result_matrix
    end

end
