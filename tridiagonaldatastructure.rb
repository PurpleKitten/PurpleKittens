require './tridiagonaldatastructurecontracts.rb'

class TridiagonalDataStructure
    
    include Enumerable #Have to implement each()
    include TridiagonalDataStructureContracts

    attr_accessor :elements
    attr_reader :size
    attr_reader :column_size

    def initialize(*rows)
        pre_init(rows)

        @upper = []
        @lower = []
        @middle = []

        create_data(rows)

        #post_init(rows)
    end

    def create_data(rows)
        upperxindex = 1
        lowerxindex = -1

        rows.each_with_index do |row,i|
            if !row[upperxindex].nil?
                @upper << row[upperxindex]
            end
            if !row[lowerxindex].nil? and lowerxindex >= 0
                @lower << row[lowerxindex]
            end

            @middle << row[i]
            lowerxindex += 1
            upperxindex += 1
        end

        puts @upper.to_s
        puts @middle.to_s
        puts @lower.to_s

    end

    def row(index)
    end

    def get_diagonal(i,j)

        diff = j-i
        ret = false
        index = -1

        if diff == 1
            index = j-1
            ret = @upper
        elsif diff == 0
            index = j
            ret = @middle
        elsif diff == -1
            index = j
            ret = @lower 
        end

        return ret, index

    end

    def [](i,j)
        
        arr, index = get_diagonal(i,j)
        return arr[index]

    end

    def []=(i,j,v)
        arr, index = get_diagonal(i,j)
        arr[index]=v
    end

    def fetch(index, default=nil)
    end

    def transpose
    end

    def to_s
    end

    def hash
    end

    def ==(other)
    end
    
    def each(&block)
    end

end
