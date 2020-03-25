class Player < ActiveRecord::Base
    has_many :rolls


    # def roll_the_dice
    #     dice = [1,2,3,4,5,6]
    #     roll1 = dice.sample
    #     roll2 = dice.sample
    #     total_roll = roll1+roll2
    #     Roll.new(:value => total_roll)
    #     puts "#{total_roll}"
    # end
    
end