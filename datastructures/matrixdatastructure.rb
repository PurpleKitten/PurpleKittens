require_relative 'generaldatastructure'
require_relative 'tridiagonaldatastructure'
require_relative '../contracts/matrixdatastructurecontracts'

#DataStructure factory
class MatrixDataStructure

    include MatrixDataStructureContracts
  
    def self.General(rows)
        MatrixDataStructureContracts.pre_general(rows)   
        result = GeneralDataStructure.new(*rows)
        MatrixDataStructureContracts.post_general(result)
        
        result
    end

    def self.Tridiagonal(rows)
        MatrixDataStructureContracts.pre_tridiagonal(rows)
        result = TridiagonalDataStructure.new(*rows)
        MatrixDataStructureContracts.post_tridiagonal(result)
        
        result
    end

end
