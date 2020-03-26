class Player < ActiveRecord::Base
    has_many :rolls
    has_many :statistics


    def roll_the_dice
        dice = [1,2,3,4,5,6]
        roll1 = dice.sample
        roll2 = dice.sample
        total_roll = roll1+roll2
        roll_object = Roll.create(:value => total_roll, :player_id => self.id)
        roll_object.save
        puts "#{self.name.capitalize} rolled #{roll_object.value}!"
        puts " "
    end

end