require_relative '../matrix_mod'
require_relative '../datastructures/matrixdatastructure'
require_relative 'matrixdelegate'
require_relative '../contracts/generalmatrixdelegatecontracts'
require 'test/unit'

class GeneralMatrixDelegate

    include GeneralMatrixDelegateContracts
    include MatrixDelegate
    attr_reader :dataStructure

    def initialize(*rows)
        @dataStructure="General"
        create_matrix(*rows)
    end

    def self.check(*rows)
        GeneralMatrixDelegate
    end

    def to_s
        pre_to_s
        result = "GeneralMatrixDelegate #{@matrix}"
        post_to_s(result)

        result
    end

    def hash
        pre_hash

        result = self.to_a.hash
        
        post_hash
        
        result
    end
    
    def each_sparse(&block)
      pre_each_sparse(&block)
      result = @matrixData.each_sparse(&block)
      post_each_sparse
      
      result
    end

    def ==(other)
        pre_equals?()

        if(other.respond_to?("to_a"))
            result = self.to_a == other.to_a
        else
            result = false
        end

        post_equals?()

        result
    end

end
