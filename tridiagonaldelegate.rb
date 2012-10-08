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
      
      #Invariants returning corrupt data where tridiagnals are attempted to be created when they shouldn't
      #Didn't have time to debug issue  
      return nil
      
      
      TridiagonalMatrixDelegateContracts.pre_check(rows)
        #insert processing here
        #return TridiagonalMatrixDelegate

        if rows.size == rows[0].size and rows.size > 2

            start = -1
            finish = 1
            check = []
            isTridiag = true
            rows.each_with_index do |row,i|

                if !isTridiag
                    break
                end

                if finish >= row.size
                    check = row - row[start..row.size-1]
                elsif start < 0
                    check = row - row[0..finish]
                else
                    check = row - row[start..finish]
                end

                check.each do |el|
                    if el != 0
                        isTridiag = false
                    end
                end

                start += 1
                finish += 1
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

        post_hash
    end

    def ==(other)
        pre_equals?(other)

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
    
    def each_sparse(&block)
      pre_each_sparse(&block)
      result = @matrixData.each_sparse(&block)
      post_each_sparse()
      
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

