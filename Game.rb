class Game

  def initialize(player1, player2)

    @players = [player1, player2]

  end

  def start
    current_player = @players[0]
    
    while current_player.lives > 0
      random = rand(1..20)
      random2 = rand(1..20)

      puts "---- New Turn ----"

      puts "#{current_player.name}: What does #{random} plus #{random2} equal?"
      
      answer = random + random2

      playerAnswer = gets.chomp.to_i
      
      if answer != playerAnswer
        current_player.lives = current_player.lives - 1
        puts "Seriously? No!"
      else
        puts "Yes! You are correct"
      end

      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"

      player_index = @players.index current_player

      if (player_index == 0)
        if (current_player.lives == 0)
          puts "#{@players[1].name} wins with a score of #{@players[1].lives}/3"
          return
        end
        current_player = @players[1]
      else
        if (current_player.lives == 0)
          puts "#{@players[0].name} wins with a score of #{@players[0].lives}/3"
          return
        end
        current_player = @players[0]
      end
      
    end

    puts "---- Game Over ----"

    puts "Good bye!"

  end
end