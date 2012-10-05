require './matrixdelegatecontracts.rb'
require './matrixdatastructure.rb'

module MatrixDelegate

    include MatrixDelegateContracts

    attr_reader :matrix

    def create_matrix(*rows)
        pre_create_matrix(*rows)
        class_invariant

        @matrix = Matrix.[](*rows)
        matrixData = MatrixDataStructure.send(@dataStructure, *rows)
        @matrix.replace_matrix_structure(matrixData)
        
        class_invariant
        post_create_matrix(*rows)
        
        @matrix
    end

    
    def method_missing(method_name, *args)
        pre_method_missing(method_name, *args)
        class_invariant

        if self.respond_to?(method_name)
            result = self.send(method_name, *args)
        else
            result = @matrix.send(method_name, *args)
        end    

        class_invariant
        post_method_missing(method_name, *args)
        
        result
    end
        
    def coerce(obj)      
      return [obj, @matrix]
    end 
    
end
