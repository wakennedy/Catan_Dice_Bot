class CommandLine 
    
    def run
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
        array.each do |player|
            player = Player.find_or_create_by(name: player)
        end
    end

    def playing_the_game(array_of_players)
        turns = 1000
        while turns > 0 do 
            array_of_players.each do |player|
                puts "#{player}, it's your turn. Type 'roll' to roll the dice. Type 'stop' to end the game."
                command = gets.chomp
                if command == "roll" 
                    dice = [1,2,3,4,5,6]
                    roll1 = dice.sample
                    roll2 = dice.sample
                    total_roll = roll1+roll2
                    Roll.new(:value => total_roll)
                    puts "#{total_roll}"
                end
                if command == "stop"
                    turns = 0 
                    puts "Game Over"
                    puts "Here are the statistics for the game"
                    puts Roll.all
                    break
                elsif command !== "roll" or "stop"
                    puts "please type a valid command"
                end
            end
        end
        turns-=1
    end
end
