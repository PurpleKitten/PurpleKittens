require './matrixdelegatecontracts.rb'
require './matrixdatastructure.rb'

module MatrixDelegate

    include MatrixDelegateContracts

    attr_reader :matrix

    def create_matrix(matrix)
        pre_create_matrix(matrix)
        class_invariant

        @matrix = matrix
        @matrixData = MatrixDataStructure.send(@dataStructure, @matrix.to_a)
        @matrix.replace_matrix_structure(@matrixData)
        
        class_invariant
        post_create_matrix(@matrix)
        
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
      pre_coerce()
      class_invariant
      
      result = [obj, @matrix]
      
      post_coerce(result)
      class_invariant
      result
    end 
    
end
