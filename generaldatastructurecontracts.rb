require 'test/unit'

module GeneralDataStructureContracts

    include Test::Unit::Assertions
    
    def pre_init(rows)
        assert(rows != nil, "Rows must be not nil!")
        
        col_size = rows[0].size
        
        rows.each do |row|
            assert(row.size == col_size, "All rows must be the same length!")
        end

    end
    def post_init(rows)
        assert(self.to_a == rows, "Data created was corrupted. \
                                   Rows input were invalidly processed")
        assert(@elements != nil)
        assert(@size == [rows.size, rows[0].size])
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
        assert(index < @size[0] || index >= 0, "Index out of bounds.")
    end
    def post_row(index, row)
        assert(row.size == @size[1], "Invalid row created from index.")
    end

    def pre_square_brackets(i,j)
    end
    def post_square_brackets(i,j)
    end

    def pre_square_bracket_equals(i,j,v)
    end
    def post_square_bracket_equals(i,j,v)
    end

    def pre_fetch(index, default)
    end
    def post_fetch(index, default)
    end

    def pre_transpose
    end
    def post_transpose
    end

    def pre_to_s
    end
    def post_to_s
    end

    def pre_hash
    end
    def post_hash
    end

    def pre_equals(other)
    end
    def post_equals(other)
    end
    
    def class_invariant
    end

end
