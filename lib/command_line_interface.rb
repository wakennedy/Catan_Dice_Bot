class CommandLine 
  
    def run
        Player.destroy_all
        Roll.destroy_all
        Statistics.destroy_all
        
        welcome
        players = get_players
        known_players = establish_players(players)
        system 'clear'
        playing_the_game(known_players)
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
                puts ""
                puts ""
                puts "#{player.name.capitalize}, it's your turn!"
                puts "_______________________________________________________"
                puts "Type 'roll' to roll the dice.                          |"
                puts "Type 'stop' to end the game.                           |"
                puts "Type 'name' to update your name at the cost of a turn. |"
                puts "An invalid command is a turn forfeited. :)             |"
                puts "--------------------------------------------------------"
                command = gets.chomp
                if command == "roll"
                    system 'clear'
                    player.roll_the_dice
                elsif command == "stop"
                    turns = 0 
                    game_over(array_of_players)
                    break
                elsif command == "name"
                    puts "please enter your new name"
                    name = gets.chomp
                    player.update(name: name)
                    player.save
                    puts "Your name has been saved"
                else 
                    system 'clear'
                    puts "please enter a valid command"
                end
            end
            turns-=1
        end
    end
    
    # def turn(player)
        
    # end


    def game_over(array)
        system 'clear'
puts "
   ____    _    __  __ _____    _____     _______ ____  
  / ___|  / \\  |  \\/  | ____|  / _ \\ \\   / / ____|  _ \\ 
 | |  _  / _ \\ | |\\/| |  _|   | | | \\ \\ / /|  _| | |_) |
 | |_| |/ ___ \\| |  | | |___  | |_| |\\ V / | |___|  _ < 
  \\____/_/   \\_\\_|  |_|_____|  \\___/  \\_/  |_____|_| \\_\\"
        puts " "
        puts " "
        array.each do |player|
            Statistics.roll_counts(player)
        end
        Statistics.most_rolled
        puts "---------------------------------------"
    end

    def welcome
puts "
__        __   _                          
\\ \\      / /__| | ___ ___  _ __ ___   ___ 
 \\ \\ /\\ / / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\
 _\\ V  V /  __/ | (_| (_) | | | | | |  __/
| |\\_/\\_/ \\___|_|\\___\\___/|_| |_| |_|\\___|
| __/ _ \\                                 
| || (_) |                                
 \\__\\___/   _   _   _                     
/ ___|  ___| |_| |_| | ___ _ __ ___       
\\___ \\ / _ \\ __| __| |/ _ \\ '__/ __|      
 ___) |  __/ |_| |_| |  __/ |  \\__ \\      
|____/ \\___|\\__|\\__|_|\\___|_|  |___/      
  ___  / _|                               
 / _ \\| |_                                
| (_) |  _|                               
 \\___/|_|   _                             
 / ___|__ _| |_ __ _ _ __                 
| |   / _` | __/ _` | '_ \\                
| |__| (_| | || (_| | | | |               
 \\____\\__,_|\\__\\__,_|_| |_|               
                                          
"
    end   



















end