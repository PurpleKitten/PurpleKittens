require_relative '../contracts/tridiagonaldatastructurecontracts'

class TridiagonalDataStructure

    include Enumerable #Have to implement each()
    include TridiagonalDataStructureContracts

    attr_accessor :upper
    attr_accessor :lower
    attr_accessor :middle
    attr_reader :size
    attr_reader :column_size

    def initialize(*rows)
        pre_init(rows)

        @upper = []
        @lower = []
        @middle = []

        create_data(rows)
        @size = rows.size
        @column_size = rows[0].size
        
        post_init(rows)
    end

    def create_data(rows)
        pre_create_data(rows)

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

        post_create_data(rows)

    end

    def each(&block)
        (0..size-1).each do |i|
            yield self.row(i)
        end
    end

    def row(index)
        pre_row(index)
        class_invariant

        row = Array.new()
        (0..size-1).each do |i|
            if i == index
                (0..column_size-1).each do |j|
                    row[j] = self[i,j]
                end
            end
        end

        class_invariant
        post_row(index,row)

        row
    end


    def [](i,j)
        pre_square_brackets(i,j)
        class_invariant

        arr, index = get_diagonal(i,j)
        val = 0
        if arr
            val = arr[index]
        end

        class_invariant
        post_square_brackets(i,j)
        val
    end

    def []=(i,j,v)
        pre_set_value(i,j,v)
        class_invariant

        arr, index = get_diagonal(i,j)
        arr[index]=v

        class_invariant
        post_set_value(i,j,v)
    end

    def fetch(index, default=nil)
        pre_fetch(index, default)
        class_invariant

        val = self.to_a()[index]

        class_invariant
        post_fetch(index,default)

        val
    end

    def transpose
        pre_transpose
        class_invariant

        trans = self.to_a.transpose

        class_invariant
        post_transpose(trans)

        trans
    end

    def to_s
        pre_to_s
        class_invariant

        s = "TridiagonalDataStructure#{self.to_a().to_s}"

        class_invariant
        post_to_s(s)
        s
    end

    def each_sparse(&block)
        pre_each_sparse(&block)
        class_invariant
        @upper.each do |el|
            yield el
        end
        @middle.each do |el|
            yield el
        end
        @lower.each do |el|
            yield el
        end
        class_invariant
        post_each_sparse()
        return @upper+@middle+@lower
    end

    def inspect
        to_s
    end

    def hash
      pre_hash
      
      result = self.to_a.hash()
      
      post_hash(result)
    end

    def ==(other)
        pre_equals(other)
        class_invariant

        e = self.to_a == other.to_a

        class_invariant
        post_equals(other)
        e
    end

    private
    def get_diagonal(i,j)
        pre_get_diagonal(i,j)
        class_invariant

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

        class_invariant
        post_get_diagonal(i,j)

        return ret, index

    end


end
