class Statistics < ActiveRecord::Base
    belongs_to :player
    has_many :rolls, through: :player

    def self.players_rolls(player)
        Roll.where(player_id: player.id).pluck(:value)
    end

    def self.total_rolls
        counts = Hash.new(0)
        Roll.all.each do |num| 
            counts[num.value]+=1
        end
        counts
        # counts.sort_by{|k,v| -v}
    end

    def self.most_rolled
        sevens = Roll.where(value: 7).pluck(:value)
        counts = Statistics.total_rolls
        counts = counts.sort_by{|k,v| -v}
        puts "---------------------------------------"
        puts "Top 3 most rolled numbers"
        puts "#{counts[0][1]} - #{counts[0][0]}s were rolled"
        puts "#{counts[1][1]} - #{counts[1][0]}s were rolled"
        puts "#{counts[2][1]} - #{counts[2][0]}s were rolled"
        #puts "#{sevens.count} - 7s were rolled"
    end


    def self.roll_counts(player)
        rolls = self.players_rolls(player)
        counts = Hash.new(0)
        rolls.each do |num| 
            counts[num]+=1
        end
        #output raw hash of players rolls
        #puts "#{player.name.capitalize}-  #{counts.sort_by{|k,v| k}.to_h}"
        puts "---------------------------------------"
        puts "#{player.name.capitalize} rolled these numbers!
2s  => #{counts[2]}
3s  => #{counts[3]}
4s  => #{counts[4]}
5s  => #{counts[5]}
6s  => #{counts[6]}
7s  => #{counts[7]}
8s  => #{counts[8]}
9s  => #{counts[9]}
10s => #{counts[10]}
11s => #{counts[11]}
12s => #{counts[12]}
            "
    end

end
