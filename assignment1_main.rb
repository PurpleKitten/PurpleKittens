 require_relative 'sparsematrix'

##
 # Dustin Durand
 # 1203271
 #
 # x = SparseMatrix.new(:identity, 5)
 # x = SparseMatrix.new(:build, 1, 2) { rand(1..20) }
 # x = SparseMatrix.new(:diagonal, 1, 2, 3, 4, 6)
 # x = SparseMatrix.new(:scalar, 3, 5)
 # x = SparseMatrix.new([[0,2,0],[4,0,2],[0,0,0]])
 # x = SparseMatrix.new([0,2,0],[4,0,2],[0,0,0])
 #
 # Note: When the class invariants for sparse matrix are turned on the library is really slow.
 # There is an override in sparsematrixcontracts.rb
 #
## 
 
puts SparseMatrix.new(:identity, 5)
puts SparseMatrix.new(:build, 1, 2) { rand(1..20) }
puts SparseMatrix.new(:diagonal, 1, 2, 3, 4, 6)
puts SparseMatrix.new(:scalar, 3, 5) 
puts SparseMatrix.new([[0,2,0],[4,0,2],[0,0,0]])
puts SparseMatrix.new([0,2,0],[4,0,2],[0,0,0])  
 
invertible = SparseMatrix.new([1,3,1],[1,1,2],[2,3,4])  
puts invertible
puts invertible.square?()
puts invertible.singular?()
puts invertible.regular?()
puts invertible.determinant()
puts invertible.inverse()


blah = SparseMatrix.new(:identity, 5)
puts (blah.map {|e| e+2}).to_s

puts blah

puts blah[1,4]
blah[0,0]=3
blah[1,1]=3
blah[2,2]=3
blah[2,2]=3
blah[3,3]=3
blah[4,4]=3
puts blah

puts blah[1,4]
blah[1,4]=3
puts blah
 
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
puts (blah * blah).to_s

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


blah = SparseMatrix.new([[2.5,0.3,-1.3],[-3.3,0.0,2.2],[-2.2,-1.4,0.0]])
puts (blah + 5.5).to_s
puts (blah / 5.5).to_s
puts (blah + blah).to_s
puts (blah + 5.5).to_s
puts (blah - blah).to_s
puts (blah - 5.5).to_s
puts (blah * 5.5).to_s
puts (blah * blah).to_s