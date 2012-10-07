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
  end
  
  
end