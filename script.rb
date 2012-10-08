 require 'sparsematrix'
 require 'matrix'
 require 'generalmatrixdelegate.rb'

#delegate = GeneralMatrixDelegate.new();
 
 
 
#blah = SparseMatrix.new([[1,2,3],[1,2,3],[1,2,3]])

blah = SparseMatrix.new([[1,2,0],[1,2,3],[0,2,3]])
  
#Zero Matrices are broken
#blah = SparseMatrix.new(:empty, 0)
#blah = SparseMatrix.new(:empty, 0, 0)
#blah = SparseMatrix.new(:empty, 3, 0)
#blah = SparseMatrix.new(:empty, 0, 3)

puts blah.to_s
blah.each_sparse() {|x| puts x}


puts (blah + blah).to_s
puts (blah + 5).to_s
puts (blah - blah).to_s

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

  
#blah = SparseMatrix.new([1,2,3],[1,2,3],[1,2,3])
#blah = SparseMatrix.new([[1,2,3]])
#blah = SparseMatrix.new([1,2,3])  
#blah = SparseMatrix.new(:identity, 3)
#blah = SparseMatrix.new(:diagonal, 1,2,3)  
#blah = SparseMatrix.new(:zero, 3,5)
#blah = SparseMatrix.new(:scalar, 5,3)
#blah = SparseMatrix.new(:build, 5,6) { rand(20) }

#blah =  blah + blah
#blah =  blah - blah

  
#puts (blah + blah).to_s 
#puts (blah * blah).to_s 
##puts (blah / blah).to_s 
#puts (blah - blah).to_s
#puts (blah == blah).to_s  
#  
#puts blah[1,2]
#blah[1,2] = 3
#puts blah[1,2]
##
#puts blah.transpose();
##
#puts blah.trace()
#puts blah.hermitian?()
##
##
#puts blah.orthogonal?()
#puts blah.symmetric?()
#puts blah.unitary?()
#puts blah.determinant()
