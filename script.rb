 require 'sparsematrix'
 require 'matrix'
 require 'generalmatrixdelegate.rb'

delegate = GeneralMatrixDelegate.new();
 
blah = Matrix.I(5)
puts blah.trace()

#puts "1: " + blah.to_s()

blah = SparseMatrix.identity(delegate, 5);
#puts "2: " + blah.to_s()

blah2 = SparseMatrix.diagonal(delegate,1,2,3,4,5)

#TRACE USES [i][i] on line matrix.rb:1165:in `block in trace'
#puts "Trace: #{blah2.trace()} for:\n" + blah2.to_s + "\n"

blah2 = SparseMatrix.rows(delegate,[[1,2,3],[4,5,6],[7,8,9]])

#puts "Trace: #{blah2.trace()} for:\n" + blah2.to_s + "\n"


#puts blah.to_s
#puts blah2.to_s



puts "Delegate: " + delegate.to_s();
puts "blah: " + blah.to_s()

#BROKEN - Inconsistent state between delegate & sparseMatrix
#blah = blah * blah

puts blah

puts "3: " + blah2.to_s()

blah = Matrix.diagonal(1,2,3,4,5)
blah = blah * blah
puts "4: " + blah.to_s()

blah = Matrix.rows([[0, 93,23,0,17,134,0], [-1, 0,34 ,0,67,12,0], [0,0,0,4,0,0,7],[0,0,0,0,0,0,0]])
puts "5: " + blah.to_s()

blah = SparseMatrix.rows(delegate, [[0, 93,23,0,17,134,0], [-1, 0,34 ,0,67,12,0], [0,0,0,4,0,0,7],[0,0,0,0,0,0,0]])
puts "5: " + blah.to_s()

#test = SparseMatrix.+(