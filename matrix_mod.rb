require './matrix.rb'
require './matrix_modcontracts.rb'
require 'test/unit'

class Matrix
    
    include Test::Unit::Assertions
    include MatrixModContracts

    #This method is to be used in the delegate to override the 
    #matrix structure
    def replace_matrix_structure(struct)
        pre_replace_structure(struct)
        result = @rows = struct
        post_replace_structure(struct, result)
        
        result
    end

end


