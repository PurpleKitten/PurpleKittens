require 'test/unit'

module GeneralDataStructureContracts

    include Test::Unit::Assertions
    
    def pre_init(rows)
        assert(rows != nil, "Rows must be not nil!")
        
        if(rows[0].respond_to?("size"))
          col_size = rows[0].size
        else
          col_size = 1
        end
        
        rows.each do |row|
            assert(row.size == col_size, "All rows must be the same length!")
        end

    end
    def post_init(rows)
        assert(self.to_a == rows, "Data created was corrupted. \
                                   Rows input were invalidly processed")
                                   
          if(rows[0].respond_to?("size"))
             col_size = rows[0].size
          else
             col_size = 1
          end
                                   
        assert(@elements != nil)
        assert(@size == rows.size  && @column_size = col_size)
    end

    def pre_create_hash(rows)
        pre_init(rows)

    end
    def post_create_hash(rows, new_hash)
        assert(new_hash != nil, "Hash created by create_hash was null")
        rows.each_with_index do |row, i|
            row.each_with_index do |el, j|
                if el == 0
                    assert(new_hash[[i,j]] == nil, "Zero element in sparse \
                                                    matrix!")
                else
                    assert(new_hash[[i,j]] != nil, "Nonzero element is nil in \
                                                    sparse matrix!")
                end
            end
        end
                
    end

    def pre_each()
    end
    def post_each()
    end

    def pre_row(index)
        assert(index.is_a?(Integer), "Index must be an integer.")
        assert(index < @size || index >= 0, "Index out of bounds.")
    end
    def post_row(index, row)
        assert(row.size == @column_size, "Invalid row created from index.")
    end

    def pre_square_brackets(i,j)
        assert( i.is_a?(Integer) && j.is_a?(Integer), "Indices must be integers.")
        assert(i < @size || i >= 0, "i index must be greater than 0 and less than #{@size}")
        assert(j < @column_size || j >= 0, "j index must be greater than 0 and less than #{@column_size}")
    end
    def post_square_brackets(i,j)
    end

    def pre_square_bracket_equals(i,j,v)
        pre_square_brackets(i, j)
    end
    def post_square_bracket_equals(i,j,v)
        post_square_brackets(i,j)
        assert(self[i,j] == v, "Value was not properly set.")
    end

    def pre_fetch(index, default)
        pre_row(index)
    end
    def post_fetch(index, default)
        assert(self.row(index) == self.to_a()[index], "Row not fetched correctly.")
    end

    def pre_transpose
        assert(self.respond_to?(:to_a), "Data must be able to be converted into an array with to_a!")

    end
    def post_transpose
    end

    def pre_to_s
        assert(self.respond_to?(:to_a), "Cannot convert to string.")
    end
    def post_to_s
    end

    def pre_hash
    end
    def post_hash
    end

    def pre_equals(other)
        assert(other.respond_to?(:each), "Cannot compare incompatible types.")
        assert(other.respond_to?(:size), "Cannot compare object without size.")
    end
    def post_equals(other)
    end
    
    def class_invariant
    end

end
