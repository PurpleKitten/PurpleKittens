 require 'sparsematrix'
 require 'matrix'
 require 'generalmatrixdelegate.rb'

#delegate = GeneralMatrixDelegate.new();
 
 
 
blah = SparseMatrix.new([[1,2,3],[1,2,3],[1,2,3]])

#Zero Matrices are broken
#blah = SparseMatrix.new(:empty, 0)
#blah = SparseMatrix.new(:empty, 0, 0)
#blah = SparseMatrix.new(:empty, 3, 0)
#blah = SparseMatrix.new(:empty, 0, 3)
  
blah =  blah + 5

blah = SparseMatrix.new([[1,2,3],[1,2,3],[1,2,3]])
blah =  blah + 5
  
  
blah = SparseMatrix.new([1,2,3],[1,2,3],[1,2,3])
blah = SparseMatrix.new([[1,2,3]])
blah = SparseMatrix.new([1,2,3])  
blah = SparseMatrix.new(:identity, 3)
blah = SparseMatrix.new(:diagonal, 1,2,3)  
blah = SparseMatrix.new(:zero, 3,5)
blah = SparseMatrix.new(:scalar, 5,3)
blah = SparseMatrix.new(:build, 5,6) { rand(20) }

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
