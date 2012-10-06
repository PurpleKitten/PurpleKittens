require './generaldatastructurecontracts.rb'
require 'test/unit'

module TridiagonalDataStructureContracts
    include Test::Unit::Assertions
    include GeneralDataStructureContracts

    def class_invariant
        assert(@size == @column_size, "Data has changed!")
        assert(@middle.size == @size, "Data has changed!")
    end

    def post_init(rows)
        assert(@upper != nil)
        assert(@lower != nil)
        assert(@middle != nil)
        assert(self.to_a == rows, "Data created was corrupted. \
                                   Rows input were invalidly processed")
        assert(@size == rows.size  && @column_size = rows[0].size)
    end


    def pre_set_value(i,j,v)
        pre_square_bracket_equals(i,j,v)
        diff = j-i
        assert(diff <= 1 || diff <= -1, "Indices must reference the main diagonals!")
    end
    def post_set_value(i,j,v)
        post_square_bracket_equals(i,j,v)
    end

    def pre_get_diagonal(i,j)
        pre_square_brackets(i,j)
    end
    def post_get_diagonal(i,j)
    end

    def pre_create_data(rows)
        assert(!rows.nil?, "Rows must not be nil!")
        assert(rows.is_a?(Array), "Rows must be an array!")
        assert(rows[0].is_a?(Array), "Rows must be an array of arrays!")
        assert(rows.size == rows[0].size, "Number of rows and row length must be equal!")
    end
    def post_create_data(rows)
        assert(!@middle.empty?, "Datastructure not created properly!")
    end
end
