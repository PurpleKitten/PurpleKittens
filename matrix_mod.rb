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

    def sparse?
        #no pre sparse conditions
        zeros = 0
        elements = 0
        self.each do |el|
            if el == 0
                zeros += 1
            else
                elements += 1
            end
        end

        ratio = Float(zeros)/Float(elements)

        if ratio >= 0.3
            return true
        else
            return false
        end
        #no post sparse conditions
    end
end


