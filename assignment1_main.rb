 require_relative 'sparsematrix'

##
# Dustin Durand
# 1203271
#
#
#
## 
 
matrix = Matrix.build(3,3) { rand(1..20) }
blah = SparseMatrix.new([[0,2,0],[4,0,2],[0,0,0]]) 

puts matrix 
puts blah

puts (matrix * blah).to_s
puts (blah * matrix).to_s

matrix = Matrix.identity(3)
blah = SparseMatrix.new([[0,2,0],[4,0,2],[0,0,0]]) 

puts blah * matrix

blah = SparseMatrix.new([[3,6,9],[12,15,18],[21,24,27]])
puts blah.to_s
puts (blah + blah).to_s
puts (blah + 5).to_s
puts (blah - blah).to_s
puts (blah - 5).to_s
puts (blah * 5).to_s
puts (blah / 5).to_s

puts blah.transpose();
puts blah.trace()
puts blah.hermitian?()
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

blah = SparseMatrix.new([[1],[2],[3]])
blah2 = SparseMatrix.new([[1,2,3,4,5]])
  
puts (blah*blah2).to_s
puts blah.transpose();
puts blah.square?()

puts "--------"
blah = SparseMatrix.new([[1,1,0],[2,2,2],[0,3,3]])
puts blah.to_s
puts (blah + blah).to_s
puts (blah + 5).to_s
puts (blah - blah).to_s
puts (blah - 5).to_s
puts (blah * 5).to_s
puts (blah / 5).to_s

puts blah.transpose();
puts blah.trace()
puts blah.hermitian?()
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
puts blah.transpose().to_s
puts blah.unitary?()
puts blah.upper_triangular?()


blah = SparseMatrix.new([[2.1,0.3,-1.3],[-3.3,0.0,2.2],[-2.2,-1.4,0.0]])
puts (blah + 5.155555).to_s
puts (blah / 5.5).to_s
puts (blah + blah).to_s
puts (blah + 5.5).to_s
puts (blah - blah).to_s
puts (blah - 5.1).to_s
puts (blah * 5.1).to_s