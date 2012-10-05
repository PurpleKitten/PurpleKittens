require './matrix_mod.rb'
require './matrixdatastructure.rb'
require './matrixdelegate.rb'
require './generalmatrixdelegatecontracts.rb'
require 'test/unit'

class GeneralMatrixDelegate
    
    include GeneralMatrixDelegateContracts
    include MatrixDelegate
    attr_reader :dataStructure

    def to_s
        "GeneralMatrixDelegate #{@matrix}"
    end

    def initialize(*rows)
        @dataStructure="General"
        create_matrix(*rows)
    end

    def self.check(*rows)
        GeneralMatrixDelegate
    end
    
end
