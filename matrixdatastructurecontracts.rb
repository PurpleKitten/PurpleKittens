require './matrixdatastructure.rb'
require 'test/unit'

module MatrixDataStructureContracts
  
  extend Test::Unit::Assertions
  
  def self.pre_general(rows)   
    verify_input(rows)   
  end
  
  def self.post_general(result)
    verify_struct(result)
  end
  
  def self.pre_tridiagonal(rows)
    verify_input(rows)
  end
  
  def self.post_tridiagonal(result)
    verify_struct(result)
  end
  
  def self.pre_diagonal(rows)
    verify_input(rows)
  end
  
  def self.post_diagonal(result)
    verify_struct(result)
  end
  
  def self.verify_input(rows)
    assert(!rows.nil?)
  end
  
  def self.verify_struct(struct)
    assert(!struct.nil?)
    assert(struct.respond_to?("to_s"), "Delegate data struct must respond to to_s")
    assert(struct.respond_to?("=="), "Delegate data struct must respond to ==")
    assert(struct.respond_to?("hash"), "Delegate data struct must respond to hash")
    assert(struct.respond_to?("each_sparse"), "Delegate data struct must respond to each_sparse")
    assert(struct.respond_to?("each"), "Delegate data struct must respond to each")
    assert(struct.respond_to?("row"), "Delegate data struct must respond to row")
    assert(struct.respond_to?("[]"), "Delegate data struct must respond to []")
    assert(struct.respond_to?("[]="), "Delegate data struct must respond to []=")
    assert(struct.respond_to?("fetch"), "Delegate data struct must respond to fetch")
    assert(struct.respond_to?("transpose"), "Delegate data struct must respond to transpose")
    assert(struct.respond_to?("size"), "Delegate data struct must respond to size")
    assert(struct.respond_to?("map"), "Delegate data struct must respond to map")
    assert(struct.respond_to?("to_a"), "Delegate data struct must respond to to_a")
  end
  
  
end