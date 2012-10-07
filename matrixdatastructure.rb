require './generaldatastructure.rb'
require './tridiagonaldatastructure.rb'
require './diagonaldatastructure.rb'
require './matrixdatastructurecontracts.rb'

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

    def self.Diagonal(rows)
        MatrixDataStructureContracts.pre_diagonal(rows)
        result = DiagonalDataStructure.new(*rows)
        MatrixDataStructureContracts.post_diagonal(result)
        
        result
    end

end
