require './generaldatastructure.rb'
require './tridiagonaldatastructure.rb'
require './diagonaldatastructure.rb'

#DataStructure factory
class MatrixDataStructure

    def self.General(rows)
        GeneralDataStructure.new(rows)
    end

    def self.Tridiagonal(rows)
        TridiagonalDataStructure.new(rows)
    end

    def self.Diagonal(rows)
        DiagonalDataStructure.new(rows)
    end

end
