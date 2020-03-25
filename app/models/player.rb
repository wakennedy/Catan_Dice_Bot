class Player < ActiveRecord::Base
    has_many :rolls


    def roll_the_dice
        dice = [1,2,3,4,5,6]
        roll1 = dice.sample
        roll2 = dice.sample
        total_roll = roll1+roll2
        roll_object = Roll.create(:value => total_roll, :player_id => self.id)
        roll_object.save
        puts "#{roll_object.value}"
    end
    
    def rolls
        self.rolls
    end

end