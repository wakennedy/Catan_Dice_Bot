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













#
#MOVED TO STATS
#
#     def roll_counts
#         rolls = self.my_rolls
#         counts = Hash.new(0)
#         rolls.each {|num| counts[num]+=1}
#         #puts "#{self.name.capitalize}-  #{counts.sort_by{|k,v| k}.to_h}"
#         puts "---------------------------------------"
#         puts "#{self.name.capitalize} rolled these numbers!
# 2s  => #{counts[2]}
# 3s  => #{counts[3]}
# 4s  => #{counts[4]}
# 5s  => #{counts[5]}
# 6s  => #{counts[6]}
# 7s  => #{counts[7]}
# 8s  => #{counts[8]}
# 9s  => #{counts[9]}
# 10s => #{counts[10]}
# 11s => #{counts[11]}
# 12s => #{counts[12]}
#             "
#     end

# def self.sevens
#     sevens = Roll.where(value: 7).pluck(:value)
#     puts "Together, you rolled #{sevens.count} => 7s!!"
# end 

# def my_rolls
#     Roll.where(player_id: self.id).pluck(:value)
# end
