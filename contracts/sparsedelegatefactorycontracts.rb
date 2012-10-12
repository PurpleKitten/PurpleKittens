require 'test/unit'

module SparseDelegateFactoryContracts

  include Test::Unit::Assertions
  
    
  def pre_create(rows)
    assert(!rows.nil?, "Input arguments cannot be nil")
    assert(rows.respond_to?("size"), "Incorrect argument provided")
    assert(rows.size > 0, "Sparse Matrix requires at least one argument")  
  end
  
  def post_create(result)
    assert(!result.nil?, "Result cannot be nil")
    assert(!@matrix.nil?, "Result cannot be nil")
    assert(result.respond_to?("to_s"), "Delegate must respond to to_s")
    assert(result.respond_to?("=="), "Delegate must respond to ==")
    assert(result.respond_to?("hash"), "Delegate must respond to hash")
    assert(result.respond_to?("coerce"), "Delegate must respond to coerce")
    assert(result.respond_to?("each_sparse"), "Delegate must respond to each_sparse")
  end
  
  def pre_determine_delegate(rows)
    assert(!rows.nil?, "Input arguments cannot be nil")
    assert(rows.respond_to?("size"), "Incorrect argument provided")
  end
  def post_determine_delegate(type)
    assert(!type.nil?, "Input arguments cannot be nil")
  end
  
  def pre_array_contains_arrayables(container)
    assert(!container.nil?)
    assert(container.respond_to?("to_a"))
  end
  
  def post_array_contains_arrayables()
    #None
  end
  
  def pre_create_matrix_from_symbol(rows)
    assert(!rows.nil?)
    assert(rows.respond_to?("[]"))
    assert(rows.respond_to?("size"))
    assert(rows.size > 1)
    
    symbol = rows[0]
    
    assert(symbol.is_a?(Symbol))   
  end
  
  def post_create_matrix_from_symbol(matrix)
    assert(!matrix.nil?)   
  end
  
  def pre_create_matrix_from_arrays(rows)
    assert(!rows.nil?)
    assert(rows.size > 0)
    rows.each{|x| assert(x.respond_to?("to_a")) } 
  end
  
  def post_create_matrix_from_arrays(matrix)
    assert(!matrix.nil?)  
  end
  
  def pre_create_matrix_from_array(container)
    assert(!container.nil?)
    assert(container.respond_to?("to_a"))
  end
  
  def post_create_matrix_from_array(result)
    assert(!result.nil?)  
  end
  
  def pre_create_matrix(rows)
    assert(!rows.nil?, "Input arguments cannot be nil")
    assert(rows.respond_to?("size"), "Incorrect argument provided")
    assert(rows.size > 0, "Sparse Matrix requires at least one argument")  
  end
  
  def post_create_matrix(result)
    assert(!result.nil?)
  end
  
end
