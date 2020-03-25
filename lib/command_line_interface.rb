class CommandLine 
  
    def run
        
        Roll.destroy_all
        

        welcome
        players = get_players
        known_players = establish_players(players)
        playing_the_game(known_players)
    end

    def welcome
        puts "Hello, welcome to my mess of code!"
    end
        
    def get_players
        puts "please type the players names in the order they take their turn"
        response = gets.chomp
        response = response.split(/\W+/)
    end

    def establish_players(array)
        confirmed_players = []
        array.each do |player|
            player = player.downcase.to_sym 
            player = Player.find_or_create_by(name: player)
            player.save
            confirmed_players << player
            
        end
        confirmed_players
    end

    def playing_the_game(array_of_players)
        turns = 1000
        command_to_roll = ["roll", "Roll"]
        command_to_stop = ["stop", "Stop"]


        while turns > 0 do 
            

            array_of_players.each do |player|
                puts "#{player.name.capitalize}, it's your turn. Type 'roll' to roll the dice. Type 'stop' to end the game."
                command = gets.chomp
                if command_to_roll.include?(command) == false && command_to_stop.include?(command) == false
                    puts "please type a valid command"
                elsif command_to_roll.include?(command)
                    player.roll_the_dice
                elsif command_to_stop.include?(command)
                    turns = 0 
                    #call end of game method
                    #break
                    puts "Game Over"
                    puts "Here are the statistics for the game.   Dice Roll => Number of times rolled."
                    ap Roll.value_count
                    break                    
                end
            end
            turns-=1
        end
    end
end
