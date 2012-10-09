require_relative 'matrix'
require_relative 'contracts/matrix_modcontracts'
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
        pre_sparse?()
        zeros = 0
        elements = 0
        self.each do |el|
            if el == 0
                zeros += 1
            else
                elements += 1
            end
        end

        if(elements == 0) 
          if(zeros > 0)
            result = true
          else
            result = false
          end
        end
        
        ratio = Float(zeros)/Float(elements)

        if ratio >= 0.3
          result = true
        else
          result = false
        end
        post_sparse?(result)
        
        result
    end
end


