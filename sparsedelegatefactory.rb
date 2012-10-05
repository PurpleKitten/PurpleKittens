require './tridiagonaldelegate.rb'
require './generalmatrixdelegate.rb'

class SparseDelegateFactory
    
    @@delegates = [TridiagonalMatrixDelegate]

    def self.create(*rows)
        #assert rows > 0    
      
        @matrix = self.create_matrix(*rows)
        puts @matrix
        
        type = self.determine_delegate(@matrix.to_a)
        
        type.new(@matrix.to_a)
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
      
      def self.create_matrix_from_symbol(*rows)
        #assert >1, 0th is symbol
        symbol = rows.delete_at(0)
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.' unless   Matrix.respond_to?(symbol.to_s)
          
        matrix = Matrix.send(symbol.to_s, *rows)
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.'  unless !matrix.nil? && matrix.is_a?(Matrix)  
        
         matrix     
      end
      
      def self.create_matrix_from_arrays(*rows)
        #rows > 0, all have "to_a"
        
        #send as []([],[],[])
        matrix = Matrix.[](*rows)
      end
      
      def self.create_matrix_from_array(container)
        #container has to_a
        containerArray = container.to_a
        
        puts containerArray.to_s
        
        raise ArgumentError, 'Invalid arguments provided to create sparse matrix.' unless containerArray.size > 0
          
            
        rows = containerArray[0]
        
        if(self.arrayContainsArrayables(rows))
          #send as rows:: [[],[],[]]
          matrix = Matrix.rows(container)
        else
          #send as []([1,2,3,4])
          matrix = Matrix.[](container)
        end 
        
        matrix      
      end
      
      def self.create_matrix(*rows)     
            #assert rows > 0
            args = rows[0]
            
            puts "x. " + args.to_s
            
            if (args.is_a?(Symbol))
              self.create_matrix_from_symbol(*rows)
            elsif (self.arrayContainsArrayables(rows))
           
              if(rows.size == 1)
                self.create_matrix_from_array(rows)
              else
                self.create_matrix_from_arrays(*rows)
              end
              
            else
              raise ArgumentError, 'Invalid arguments provided to create sparse matrix.'
            end         
       end
  
  end
