require './tridiagonaldelegate.rb'
require './generalmatrixdelegate.rb'

class SparseDelegateFactory
    
    @@delegates = [TridiagonalMatrixDelegate]

    def self.create(*rows, &block)
        #assert rows > 0    
      
        @matrix = self.create_matrix(*rows, &block)
        
        type = self.determine_delegate(@matrix.to_a)
        
        type.new(@matrix)
    end

    def self.determine_delegate(*rows)

        type = nil

        @@delegates.each do |del|
            type = del.check(*rows)
        end

        if type == nil
            type = GeneralMatrixDelegate
        end

        type
    end
    
    private  
    def self.arrayContainsArrayables(container)
      #assert container.to_a
      array = container.to_a
      
      containsOnlyArrays = true
      
      array.map do | element | 
        containsOnlyArrays &= element.respond_to?("to_a")
      end
      
      containsOnlyArrays
    end
      
      def self.create_matrix_from_symbol(*rows, &block)
        #assert >1, 0th is symbol
        symbol = rows.delete_at(0)
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.' unless   Matrix.respond_to?(symbol.to_s)
          
        matrix = Matrix.send(symbol.to_s, *rows, &block)
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.'  unless !matrix.nil? && matrix.is_a?(Matrix)  
        
         matrix     
      end
      
      def self.create_matrix_from_arrays(*rows, &block)
        #rows > 0, all have "to_a"
        
        #send as []([],[],[])
        matrix = Matrix.[](*rows, &block)
      end
      
      def self.create_matrix_from_array(container, &block)
        #container has to_a
        containerArray = container.to_a
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.' unless containerArray.size > 0
        
        if(self.arrayContainsArrayables(container))
          #send as rows:: [[],[],[]]
          matrix = Matrix.rows(container, &block)
        else
          #send as []([1,2,3,4])
          matrix = Matrix.[](container, &block)
        end 
        
        matrix      
      end
      
      def self.create_matrix(*rows, &block)     
            #assert rows > 0
            args = rows[0]
            
            if (args.is_a?(Symbol))
              self.create_matrix_from_symbol(*rows, &block)
            elsif (self.arrayContainsArrayables(rows))
           
              if(rows.size == 1)
                self.create_matrix_from_array(*rows, &block)
              else
                self.create_matrix_from_arrays(*rows, &block)
              end
              
            else
              raise ArgumentError, 'Invalid arguments provided to create sparse matrix.'
            end         
       end
  
  end
