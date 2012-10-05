module MatrixModContracts
    
    def pre_replace_structure(struct)
        methods = [:transpose, :each, :fetch, :size,
                   :column_size, :map, :hash]
        methods.each do |method|
            assert(struct.respond_to?(method), "Data structure does not respond to #{method},\
                                            it is incompatible with Matrix")
        end
    end
    def post_replace_structure(struct, result)
        assert(struct == result, "The data structure was not replaced successfully")
    end

    def invariant
    end
end
