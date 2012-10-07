require './matrix_mod.rb'
require './matrixdatastructure.rb'
require './tridiagonaldelegatecontracts.rb'
require './matrixdelegate.rb'

class TridiagonalMatrixDelegate

    include TridiagonalMatrixDelegateContracts
    include MatrixDelegate
    attr_reader :dataStructure

    def to_s
        "TridiagonalDelegate #{@matrix}"
    end

    def initialize(*rows)
        @dataStructure="Tridiagonal"
        create_matrix(*rows)
    end
    
    def self.check(rows)
        #insert processing here
        #return TridiagonalMatrixDelegate
        nil
    end

end

