require 'test/unit'

module GeneralDataStructureContracts

    include Test::Unit::Assertions
    
    def pre_init(*rows)
        assert(rows != nil, "Invalid parameters specified to initalize")
        assert(rows.respond_to?("[]"), "Rows wrapper doesn't respond to []")
        assert(rows.respond_to?("size"), "Rows wrapper doesn't respond to size")
        assert(rows.size > 0, "No parameters passed into initialize")
        
        rows = rows[0] #remove args* wrapper
        
        assert(rows != nil, "Invalid parameters specified to initalize")
        assert(rows.respond_to?("[]"), "Rows doesn't respond to []")
        assert(rows.respond_to?("size"), "Rows doesn't respond to size")
        assert(rows.size >= 0, "No parameters passed into initialize")
        
        
        if(rows[0].respond_to?("size"))
          column_size = rows[0].size
        else
          column_size = 1
        end
        
        rows.each do |row|
            assert(row.size == column_size, "All rows must be the same length!")
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
        class_invariant        
    end

    def pre_each(&block)
      class_invariant
      assert(block_given?, "Each requires a block to run")
    end
    def post_each()
      class_invariant
    end
    
    def pre_each_key(&block)
      class_invariant
      assert(block_given?, "Each requires a block to run")
    end
    def post_each_key()
      class_invariant
    end

    def pre_row(index)
        class_invariant
        assert(index.is_a?(Integer), "Index must be an integer.")
        assert(index < @size || index >= 0, "Index out of bounds.")
    end
    def post_row(index, row)
        assert(row.size == @column_size, "Invalid row created from index.")
        class_invariant
    end

    def pre_square_brackets(i,j)
        class_invariant
        assert( i.is_a?(Integer) && j.is_a?(Integer), "Indices must be integers.")
        assert(i < @size || i >= 0, "i index must be greater than 0 and less than #{@size}")
        assert(j < @column_size || j >= 0, "j index must be greater than 0 and less than #{@column_size}")
    end
    def post_square_brackets(i,j)
        class_invariant
    end

    def pre_square_bracket_equals(i,j,v)
        class_invariant
        pre_square_brackets(i, j)
    end
    def post_square_bracket_equals(i,j,v)
        post_square_brackets(i,j)
        assert(self[i,j] == v, "Value was not properly set.")
        class_invariant
    end

    def pre_fetch(index, default)
        class_invariant
        pre_row(index)
    end
    def post_fetch(index, default)
        assert(self.row(index) == self.to_a()[index], "Row not fetched correctly.")
        class_invariant
    end

    def pre_transpose
      class_invariant
        assert(self.respond_to?(:to_a), "Data must be able to be converted into an array with to_a!")

    end
    def post_transpose
      class_invariant
    end

    def pre_to_s
      class_invariant
        assert(self.respond_to?(:to_a), "Cannot convert to string.")
    end
    def post_to_s(result)
        assert(!result.nil?, "to_s cannot return a nil value")
        assert(result.is_a?(String), "to_s must return a string value")
      class_invariant
    end

    def pre_hash
      class_invariant
      #None
    end
    def post_hash(result)
      assert(!result.nil?, "Hash cannot return a nil value")
      class_invariant
    end

    def pre_equals(other)
        class_invariant
        assert(other.respond_to?(:each), "Cannot compare incompatible types.")
        assert(other.respond_to?(:size), "Cannot compare object without size.")
    end
    def post_equals(other)
      class_invariant
    end
    
    def class_invariant
    end

end
