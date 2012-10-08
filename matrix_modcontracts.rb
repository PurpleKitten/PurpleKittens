module MatrixModContracts
    
    def pre_replace_structure(struct)
      
        assert(!struct.nil?)
      
        methods = [:transpose, :each, :fetch, :size,
                   :column_size, :map, :hash, :to_a]
        methods.each do |method|
        assert(struct.respond_to?(method), "Data structure does not respond to #{method},\
                                            it is incompatible with Matrix")
        end
    end
    def post_replace_structure(struct, result)
        assert(struct == result, "The data structure was not replaced successfully")
    end
    
    def pre_sparse?()
    end
    
    def post_sparse?(result)
      assert(!result.nil?)
      assert(result == true || result == false)
    end
end
