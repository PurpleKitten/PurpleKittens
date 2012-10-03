require './matrix_mod.rb'
require './matrixdatastructure.rb'
require './tridiagonaldelegatecontracts.rb'
require './matrixdelegate.rb'

class TridiagonalMatrixDelegate

    include TridiagonalMatrixDelegateContracts
    include MatrixDelegate

    def create_matrix(method_name, *args)
        @matrix = Matrix.send(method_name, args)
        matrixData = MatrixDataStructure.Tridiagonal(@matrix.get_rows)
        @matrix.replace_data_structure(matrixData)
    end

    private_class_method :create_matrix

end

