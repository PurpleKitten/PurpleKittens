require 'test/unit'

module MatrixConvertContracts
    include Test::Unit::Assertions

    def pre_to_matrix(obj)
        assert(!obj.nil?,"Object to convert must not be nil!")
    end
    def post_to_matrix(obj,result)
        assert(obj.to_a == result.to_a, "Object not converted to matrix!")
    end

    def pre_to_sparse_matrix(obj)
        pre_to_matrix(obj)
    end
    def post_to_sparse_matrix(obj,result)
        assert(obj.to_a == result.to_a, "Object not converted to sparse matrix!")
    end

end
