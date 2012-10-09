require_relative '../sparsematrix'
require_relative '../contracts/matrixconvertcontracts'
require_relative '../matrix'
require 'test/unit'

module MatrixConvert

    include MatrixConvertContracts

    def to_matrix(obj)
        pre_to_matrix(obj)
        ret = obj
        if obj.respond_to?(:to_a)
            ret = Matrix.[](*obj.to_a)
        end
        post_to_matrix(obj,ret)
        ret
    end
    def to_sparse_matrix(obj)
        pre_to_sparse_matrix(obj)
        ret = obj
        if obj.respond_to?(:to_a)
            ret = SparseMatrix.new(*obj.to_a)
        end
        post_to_sparse_matrix(obj,ret)
        ret
    end
end
