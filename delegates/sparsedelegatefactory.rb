require_relative 'tridiagonaldelegate'
require_relative 'generalmatrixdelegate'
require_relative '../contracts/sparsedelegatefactorycontracts'
require 'test/unit'


class SparseDelegateFactory
  
    extend Test::Unit::Assertions
    extend SparseDelegateFactoryContracts
  
    @@delegates = [TridiagonalMatrixDelegate]

    def self.create(rows, &block)      
        pre_create(rows)
        
        @matrix = self.create_matrix(*rows, &block)
        type = self.determine_delegate(@matrix.to_a)
          
        result = type.new(@matrix)
        
        post_create(result)
        
        result
        
    end
   
    
    def self.determine_delegate(rows)

        pre_determine_delegate(rows)
        type = nil
        
        @@delegates.each do |del|
            type = del.check(rows)          
            break if !type.nil?           
        end

        if type == nil
            type = GeneralMatrixDelegate
        end
        
        post_determine_delegate(type)

        type
    end
    
    private  
    
    def self.array_contains_arrayables(container)
        
      pre_array_contains_arrayables(container)

      array = container.to_a
      
      contains_only_arrays = true
      
      array.map do | element | 
        contains_only_arrays &= element.respond_to?("to_a")
      end
      post_array_contains_arrayables()
      
      contains_only_arrays
    end
      
      def self.create_matrix_from_symbol(*rows, &block)
        
        pre_create_matrix_from_symbol(rows)
        #assert >1, 0th is symbol
        symbol = rows.delete_at(0)
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.' unless   Matrix.respond_to?(symbol.to_s)
          
        matrix = Matrix.send(symbol.to_s, *rows, &block)
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.'  unless !matrix.nil? && matrix.is_a?(Matrix)  
        post_create_matrix_from_symbol(matrix)
        
         matrix     
      end
      
      def self.create_matrix_from_arrays(*rows, &block)
        
        pre_create_matrix_from_arrays(rows)        
        #send as []([],[],[])
        matrix = Matrix.[](*rows, &block)
        post_create_matrix_from_arrays(matrix)
        
        matrix
      end
      
      def self.create_matrix_from_array(container, &block)
        
        pre_create_matrix_from_array(container)

        containerArray = container.to_a
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.' unless containerArray.size >= 0
        
        if(self.array_contains_arrayables(container))
          #send as rows:: [[],[],[]]
          matrix = Matrix.rows(container, &block)
        else
          #send as []([1,2,3,4])
          matrix = Matrix.[](container, &block)
        end 
        
        post_create_matrix_from_array(matrix)
        
        matrix      
      end
      
      def self.create_matrix(*rows, &block)     
            
            pre_create_matrix(rows)

            args = rows[0]
            
            if (args.is_a?(Symbol))
              result = self.create_matrix_from_symbol(*rows, &block)
            elsif (self.array_contains_arrayables(rows))
           
              if(rows.size == 1)
                result = self.create_matrix_from_array(*rows, &block)
              else
                result = self.create_matrix_from_arrays(*rows, &block)
              end
              
            else
              raise ArgumentError, 'Invalid arguments provided to create sparse matrix.'
            end 
            post_create_matrix(result)   
            result      
         end
  
  end
