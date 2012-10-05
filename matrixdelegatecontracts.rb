require 'test/unit'

module MatrixDelegateContracts
    
    include Test::Unit::Assertions

    def pre_method_missing(method_name, *args)
        assert(self.respond_to?(method_name) || @matrix.respond_to?(method_name),
               "Method \"#{method_name}\" not defined in delegate or Matrix class.")
    end
    def post_method_missing(method_name, *args)
    end

    def pre_init(rows)
    end
    def post_init(rows)
    end

    def class_invariant
    end
end
