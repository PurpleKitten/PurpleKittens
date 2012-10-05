 require 'sparsematrix'
 require 'matrix'
 require 'generalmatrixdelegate.rb'

#delegate = GeneralMatrixDelegate.new();
 
blah = SparseMatrix.new([[1,2,3],[1,2,3],[1,2,3]])
  
puts (blah + blah).to_s 
puts (blah * blah).to_s 
#puts (blah / blah).to_s 
puts (blah - blah).to_s
puts (blah == blah).to_s  
  
puts blah[1,2]
blah[1,2] = 3
puts blah[1,2]
#
puts blah.transpose();
#
puts blah.trace()
puts blah.hermitian?()
#
#
puts blah.orthogonal?()
puts blah.symmetric?()
puts blah.unitary?()
puts blah.determinant()
