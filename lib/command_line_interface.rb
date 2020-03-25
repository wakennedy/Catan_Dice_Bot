class CommandLine 
  
    def run
        Player.destroy_all
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
        while turns > 0 do 
            array_of_players.each do |player|
                puts "#{player.name.capitalize}, it's your turn. Type 'roll' to roll the dice. Type 'stop' to end the game."
                command = gets.chomp
                if command == "roll"
                    player.roll_the_dice
                elsif command == "stop"
                    turns = 0 
                    game_over(array_of_players)
                    break
                else
                    puts "please type a valid command"
                end
            end
            turns-=1
        end
    end

    def game_over(array)
puts "
   ____    _    __  __ _____    _____     _______ ____  
  / ___|  / \\  |  \\/  | ____|  / _ \\ \\   / / ____|  _ \\ 
 | |  _  / _ \\ | |\\/| |  _|   | | | \\ \\ / /|  _| | |_) |
 | |_| |/ ___ \\| |  | | |___  | |_| |\\ V / | |___|  _ < 
  \\____/_/   \\_\\_|  |_|_____|  \\___/  \\_/  |_____|_| \\_\\"






        puts "----------------------------------"
        puts "Here are the statistics for the game."
        puts "----------------------------------"
        puts "Dice Roll => Number of times rolled."
        puts "----------------------------------"

        array.each do |player|
            player.roll_counts
        end
    end




end