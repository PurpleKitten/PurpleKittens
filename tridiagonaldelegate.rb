require './matrix_mod.rb'
require './matrixdatastructure.rb'
require './tridiagonaldelegatecontracts.rb'
require './matrixdelegate.rb'

class TridiagonalMatrixDelegate

    include TridiagonalMatrixDelegateContracts
    include MatrixDelegate
    attr_reader :dataStructure

    def to_s
        "TridiagonalDelegate #{@matrix}"
    end

    def initialize(*rows)
        pre_initalize(*rows)
        @dataStructure="Tridiagonal"
        result = create_matrix(*rows)
        post_initialize()
        
        result      
    end
    
    def self.check(rows)
      TridiagonalMatrixDelegateContracts.pre_check(rows)
      #insert processing here
      #return TridiagonalMatrixDelegate
      result = nil
      TridiagonalMatrixDelegateContracts.post_check
      
      result
    end
    
      def to_s
        pre_to_s
        result = "TridiagonalMatrixDelegate #{@matrix}"
        post_to_s(result)
        
        result
      end
      
      def hash
        pre_hash
        
        post_hash
      end
      
      def ==(other)
        pre_equals?()
        
        #temp impl
        if(other.respond_to?("to_a"))
          result = @matrix.to_a == other.to_a
        else
          result = false
        end
        
        post_equals?()
        
        result
      end
      
      def -(m)
        pre_minus_sign(m)
        if(m.respond_to?("minus"))
          result = minus(m)
        else
          result = scalar_operation(){|x| x - m.to_f}      
        end
        
        post_minus_sign(m, result)
        result
      end
      
  private 
      def minus(m)
       pre_minus(m)
       
       #temp
       result = @matrix.send("-", m)
        
       post_minus(m, result)
       
       result
      end

end

