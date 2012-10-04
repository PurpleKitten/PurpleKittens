require './matrix_mod.rb'
require './matrixdatastructure.rb'
require './matrixdelegate.rb'
require './generalmatrixdelegatecontracts.rb'
require 'test/unit'

class GeneralMatrixDelegate
    
    include GeneralMatrixDelegateContracts
    include MatrixDelegate
    
  def to_s
      "GeneralMatrixDelegate #{@matrix}"
  end
    
    private
    def create_matrix(method_name, *args)
        pre_create_matrix(method_name, *args)
        class_invariant

        @matrix = Matrix.send(method_name, *args)
        matrixData = MatrixDataStructure.General(@matrix.get_rows)
        @matrix.replace_matrix_structure(matrixData)
        
        class_invariant
        post_create_matrix(method_name, *args)
        
        @matrix
    end
    
end
