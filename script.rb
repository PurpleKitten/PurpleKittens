 require_relative 'sparsematrix'
 require_relative 'matrix'
 require_relative 'delegates/generalmatrixdelegate.rb'

#delegate = GeneralMatrixDelegate.new();
 

blah = SparseMatrix.new([[2.1,0.3,-1.3],[-3.3,0.0,2.2],[-2.2,-1.4,0.0]])

puts (blah + 5.155555).to_s
  
puts (blah / 5.1).to_s


puts blah.to_s
puts (blah + blah).to_s
puts (blah + 5.155555).to_s
puts (blah - blah).to_s
puts (blah - 5.1).to_s
puts (blah * 5.1).to_s

blah = SparseMatrix.new([[3,5,0],[6,7,8],[9,1,0]])
puts blah.to_s
puts (blah + blah).to_s
puts (blah + 5.1).to_s
puts (blah - blah).to_s
puts (blah - 5.1).to_s
puts (blah * 5.1).to_s
puts (blah / 5.0).to_s

#puts (blah + 5).to_s
blah = SparseMatrix.new([[1.1,5.2,0],[6.3,7.6,8],[9.4,1.2,0]])
puts (blah - blah).to_s
puts (blah * blah).to_s
puts (blah ** 3).to_s
#puts (blah / blah).to_s
puts (blah == blah).to_s
puts (blah === blah).to_s
puts (blah[0,0]).to_s
#puts blah.inverse().to_s
puts blah.coerce(nil).to_s


#hmm - can we fix this?
#puts (5 + blah).to_s

#Matrix doesn't implement
#puts (blah - 5).to_s 

#(Cannot do 5 operation blah)

puts blah.transpose();
##
puts blah.trace()
puts blah.hermitian?()
##
##
puts blah.orthogonal?()
puts blah.symmetric?()
puts blah.unitary?()
puts blah.determinant() 
puts blah.diagonal?()
puts blah.empty?()
puts blah.hermitian?()
puts blah.lower_triangular?()
puts blah.normal?()
puts blah.permutation?()
puts blah.rank()
puts blah.row_size()
puts blah.column_size()
puts blah.square?()
puts blah.symmetric?()
puts blah.trace()
puts blah.transpose()
puts blah.unitary?()
puts blah.upper_triangular?()
  
#blah = SparseMatrix.new([1,2,3],[1,2,3],[1,2,3])
#blah = SparseMatrix.new([[1,2,3]])
#blah = SparseMatrix.new([1,2,3])  
#blah = SparseMatrix.new(:identity, 3)
#blah = SparseMatrix.new(:diagonal, 1,2,3)  
#blah = SparseMatrix.new(:zero, 3,5)
#blah = SparseMatrix.new(:scalar, 5,3)
#blah = SparseMatrix.new(:build, 5,6) { rand(20) }

