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

    def +(m)
        pre_plus_sign(m)
        if(m.respond_to?("plus"))
            result = plus(m)
        else
            result = scalar_operation(){|x| x + m.to_f}      
        end

        post_plus_sign(m, result)
        result
    end

    def to_s
        pre_to_s
        result = "GeneralMatrixDelegate #{@matrix}"
        post_to_s(result)

        result
    end

    def hash
        pre_hash

        post_hash
    end
    
    def each_sparse(&block)
      pre_each_sparse(&block)
      result = @matrixData.each_sparse(&block)
      post_each_sparse
      
      result
    end

    def ==(other)
        pre_equals?()

        #temp impl
        if(other.respond_to?("to_a"))
            result = @matrix.to_a == other.to_a
        else
            result = false
        end

        post_equals?()

        result
    end

    private 
    def plus(m)
        pre_plus(m)

        #temp
        result = @matrix.send("+", m)

        post_plus(m, result)

        result
    end


end