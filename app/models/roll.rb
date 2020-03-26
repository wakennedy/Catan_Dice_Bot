class Roll < ActiveRecord::Base
    belongs_to :player
    
    # def self.value_count
    #     counts = {}
    #     self.all.each do |num|
    #         if !counts[num.value]
    #             counts[num.value] = 1
    #         elsif counts[num.value]
    #             counts[num.value] +=1
    #         end
    #     end
    #     counts
    # end
end
