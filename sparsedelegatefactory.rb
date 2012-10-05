require './tridiagonaldelegate.rb'
require './generalmatrixdelegate.rb'

class SparseDelegateFactory
    
    @@delegates = [TridiagonalMatrixDelegate]

    def self.create(*rows)

        type = self.determine_delegate(*rows)
        
        type.new(*rows)
    end

    def self.determine_delegate(*rows)

        type = nil

        @@delegates.each do |del|
            type = del.check(*rows)
        end

        if type == nil
            type = GeneralMatrixDelegate
        end

        type
    end


end
