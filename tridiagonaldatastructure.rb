require './tridiagonaldatastructurecontracts.rb'

class TridiagonalDataStructure
    
    include Enumerable #Have to implement each()
    include TridiagonalDataStructureContracts

    attr_accessor :elements
    attr_reader :size
    attr_reader :column_size

    def initialize(rows = nil)
    end
    
    def each(&block)
    end

end
