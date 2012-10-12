require_relative 'matrix_mod'
require_relative 'utils/matrixconvert'
require_relative 'contracts/sparsematrixcontracts'
require 'test/unit'
require_relative 'delegates/sparsedelegatefactory'

class SparseMatrix

    include Enumerable #Have to implement each()
    include SparseMatrixContracts
    include MatrixConvert

    attr_accessor :delegate
    attr_accessor :matrix
    protected :matrix

    def initialize(*rows, &block)
        pre_init(rows)
        
        exception_handler() do
          @delegate = SparseDelegateFactory.create(rows, &block)
          @matrix = @delegate.matrix
        end
        post_init()
    end

    def *(m)
        pre_multiply(m)
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_multiply(m, result)

        result
    end
    alias multiply *

    def **(m)
        pre_exponential(m)
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_exponential(m, result)

        result
    end
    alias exp **

    def +(m)
        pre_addition(m)
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_addition(m, result)

        result
    end
    alias plus +

    def -(m)
        pre_subtraction(m)
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_subtraction(m, result)

        result
    end
    alias minus -

    def /(m)
        pre_divide(m)
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_divide(m, result)

        result
    end
    alias divide /

    def ==(m)
        pre_equals?()
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_equals?()

        result
    end

    def ===(m)
        pre_equals?()
        class_invariant
        result = delegate_method(__method__, m)
        class_invariant
        post_equals?()

        result
    end

    def [](i,j)
        pre_access_ij_element(i,j)
        class_invariant
        result = exception_handler() { @matrix[i,j] }
        class_invariant
        post_access_ij_element(result)

        result
    end

    def []=(i,j,k)
        pre_set_ijk_element(i,j)
        class_invariant
        result = exception_handler() { @matrix.get_rows()[i,j]=k }
        class_invariant
        post_set_ijk_element(result)

        result
    end

    def coerce(m)
        pre_coerce(m)
        class_invariant
        result = exception_handler() { @delegate.send(__method__, m) }
        class_invariant
        post_coerce(result)

        result
    end

    def determinant
        pre_determinant()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_determinant(result)

        result
    end
    alias_method :det, :determinant

    def diagonal?
        pre_diagonal?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_diagonal?()

        result
    end

    def empty?
        pre_empty?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_empty?(result)

        result
    end

    def find_index(*args)
        pre_find_index(*args)
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_find_index(result)

        result
    end

    def round(ndigits=0)
        pre_round(ndigits)
        class_invariant
        result = delegate_method(__method__, ndigits.to_i)
        class_invariant
        post_round(result)

        result
    end

    def hash()
        pre_hash()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_hash(result)

        result
    end

    def hermitian?()
        pre_hermitian?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_hermitian?()

        result
    end

    def inverse()
        pre_inverse()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_inverse(result)

        result
    end

    def lower_triangular?()
        pre_lower_triangular?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_lower_triangular?()

        result
    end

    def normal?()
        pre_normal?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_normal?()

        result
    end

    def orthogonal?()
        pre_orthogonal?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_orthogonal?()

        result
    end

    def permutation?()
        pre_permutation?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_permutation?()

        result
    end

    def rank()
        pre_rank()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_rank(result)

        result
    end

    def regular?()
        pre_regular?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_regular?(result)
        result
    end

    def row_size()
        pre_row_size()
        result = delegate_method(__method__)
        post_row_size(result)

        result
    end

    def column_size()
        pre_column_size()
        result = delegate_method(__method__)
        post_column_size(result)

        result
    end

    def singular?()
        pre_singular?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_singular?()

        result
    end

    def square?()
        pre_square?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_square?()

        result
    end

    def symmetric?()
        pre_symmetric?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_symmetric?()

        result
    end

    def to_a()
        pre_to_a()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_to_a(result)

        result
    end  

    def to_s()
        pre_to_s()
        result = "Sparse#{@matrix}"
        post_to_s(result)

        result
    end

    def trace()
        pre_trace()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_trace(result)

        result
    end

    def transpose()
        pre_transpose()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_transpose(result)

        result
    end

    def unitary?()
        pre_unitary?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_unitary?()

        result
    end

    def upper_triangular?()
        pre_upper_triangular?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_upper_triangular?()

        result
    end

    def zero?()
        pre_zero?()
        class_invariant
        result = delegate_method(__method__)
        class_invariant
        post_zero?()

        result
    end

    def each_sparse(&block)
        pre_each_sparse(&block)
        class_invariant
        result = exception_handler() { @delegate.each_sparse(&block) }
        class_invariant
        post_each_sparse()

        result
    end

    def each(which = :all, &block)
        pre_each(which, &block)
        class_invariant
        
        result = exception_handler() { @matrix.each(which, &block) }
        
        class_invariant
        post_each()

        result
    end

    private
    def delegate_method(method_name, *args, &block)

        pre_delegate_method(method_name)
        class_invariant
        #We are checking in the delegate if we respond to this method.
        #See method_missing in matrixdelegate.rb
        result = exception_handler{ @delegate.send(method_name, *args, &block) }

        if result.respond_to?("sparse?")
            if result.sparse?
                result = to_sparse_matrix(result)
            end
        end
        
        class_invariant
        post_delegate_method

        result
    end
    
    def exception_handler(&block)
      pre_exception_handler(&block)
           
      begin
        result = yield unless !block_given?
      rescue NoMemoryError => no_mem
      
        raise
      rescue NotImplementedError => not_impl
      
        raise
      rescue Interrupt => interrupt
      
        raise
      rescue SignalException => signal
      
        raise  
      rescue ArgumentError => arg_err
        
        raise
      rescue IndexError => index_err
        
        raise   
      rescue SystemExit => sys_exit
        
        raise  
      rescue LocalJumpError => lje
          
        raise
      rescue KeyError => key_err
        
        raise
      rescue NoMethodError => no_mthd_err
        
        raise
      rescue NameError => name_err
        
        raise
      rescue FloatDomainError => float_domain_err 
        
        raise  
      rescue RangeError => range_err   
      
        raise
      rescue RuntimeError => run_err
        
        raise
      rescue SystemCallError  => sys_call_err
        
        raise
      rescue TypeError => type_err
        
        raise
      rescue ZeroDivisionError => zero_div_err  
      
        raise
      rescue StandardError => std_err
       
        raise
      rescue => unknown
        raise
      end
      
      post_exception_handler
      
      result
    end
    


end
