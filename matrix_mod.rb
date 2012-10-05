require './matrix.rb'
require './matrix_modcontracts.rb'
require 'test/unit'

class Matrix
    
    include MatrixModContracts

    #This method is to be used in the delegate to override the 
    #matrix structure
    def replace_matrix_structure(struct)
        #assert( struct.responds_to?(transpose,each,fetch,size,map,hash)
        @rows = struct
    end

end


