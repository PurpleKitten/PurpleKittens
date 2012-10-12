require_relative '../matrix_mod'
require_relative '../datastructures/matrixdatastructure'
require_relative '../contracts/tridiagonaldelegatecontracts'
require_relative 'matrixdelegate'

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
        
        first_param = rows[0]
        
        if(!first_param.respond_to?("size") or !first_param.respond_to?("each_with_index"))
          return nil
        end 
      
        if rows.size == rows[0].size and rows.size > 2

            isTridiag = true
            rows.each_with_index do |row,i|
              break unless isTridiag
              
              if(!first_param.respond_to?("each_with_index"))
                return nil
              end 
              
              row.each_with_index do |value, j|
                break unless isTridiag
                
                if(i - 2 >= j or j - 2 >= i)
                  isTridiag = false unless value == 0
                end
              end
            end              
        end
        
        result = nil
        result = TridiagonalMatrixDelegate if isTridiag

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
        result = self.to_a.hash
        post_hash(result)
        
        result
    end

    def ==(other)
        pre_equals?(other)

        if(other.respond_to?("to_a"))
            result = @matrix.to_a == other.to_a
        else
            result = false
        end

        post_equals?()

        result
    end
    
    def each_sparse(&block)
      pre_each_sparse(&block)
      result = @matrixData.each_sparse(&block)
      post_each_sparse()
      
      result
    end

end

