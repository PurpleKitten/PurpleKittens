require './matrix_mod.rb'
require './matrixdatastructure.rb'
require './matrixdelegate.rb'
require './generalmatrixdelegatecontracts.rb'
require 'test/unit'

class GeneralMatrixDelegate
    
    include GeneralMatrixDelegateContracts
    include MatrixDelegate
    
    private
    def create_matrix(method_name, *args)
        @matrix = Matrix.send(method_name, *args)
        matrixData = MatrixDataStructure.General(@matrix.get_rows)
        @matrix.replace_matrix_structure(matrixData)
    end 
    
    def to_s
        "GeneralMatrixDelegate #{@matrix}"
    end
end
