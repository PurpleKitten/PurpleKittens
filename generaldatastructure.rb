require './generaldatastructurecontracts.rb'
require 'test/unit'

#This is a general matrix data structure
class GeneralDataStructure
    include Enumerable #Have to implement each()
    include GeneralDataStructureContracts

    attr_accessor :elements
    attr_reader :size

    def initialize(*rows)
        pre_init(rows)
        class_invariant()
        #assert(all rows are the same column size)
        
        #Note that in ruby 1.9.3, a hash
        #keeps the order that you put the
        #elements in
        
        @elements = self.create_hash(rows)
        @size = [rows.size,rows[0].size]

        class_invariant()
        post_init(rows)
        self
    end

    def create_hash(rows)
        pre_create_hash(rows)
        class_invariant()

        new_hash = Hash.new
        rows.each_with_index do |row,i|
            row.each_with_index do |col,j|
                new_hash[[i,j]] = col unless col == 0
            end
        end

        class_invariant()
        post_create_hash(rows, new_hash)
        new_hash
    end

    def each(&block)
        #yield the rows
        (0..size[0]-1).each do |i|
            yield self.row(i)
        end
        self.elements
    end

    def row(index)
        pre_row(index)
        class_invariant()

        row = Array.new()
        (0..size[0]-1).each do |i|
            if i == index
                (0..size[1]-1).each do |j|
                    row[j] = self[i,j]
                end
            end
        end

        class_invariant()
        post_row(index, row)
        row
    end

    def [](i, j)
        pre_square_brackets(i,j)
        class_invariant()

        #assert must be within i,j
        if @elements[[i,j]] == nil
            el = 0
        else
            el = @elements[[i, j]]
        end

        class_invariant()
        post_square_brackets(i,j)

        el
    end

    def []=(i, j, v)
        pre_square_bracket_equals(i,j,v)
        class_invariant()

        #assert must be within i,j
        @elements[[i, j]] = v

        class_invariant()
        post_square_bracket_equals(i,j,v)
    end

    def fetch(index, default=nil)
        pre_fetch(index,default)
        class_invariant()

        array=self.to_a

        class_invariant()
        post_fetch(index, default)
        array[index]
    end

    def transpose()
        pre_transpose
        class_invariant()

        a = self.to_a

        class_invariant()
        post_transpose
        a.transpose
    end

    def to_s
        pre_to_s
        class_invariant()

        s = "#{self.to_a}"

        class_invariant()
        post_to_s
        s
    end

    def hash
        pre_hash
        class_invariant()

        class_invariant()
        post_hash
    end

    def ==(other)
        pre_equals
        class_invariant()

        class_invariant()
        post_equals
    end

end
