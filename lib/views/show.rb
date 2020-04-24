class Show

  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    puts "-" * 13
    puts "| #{board.cases_hash[:a1].value} | #{board.cases_hash[:a2].value} | #{board.cases_hash[:a3].value} |"
    puts "-" * 13
    puts "| #{board.cases_hash[:b1].value} | #{board.cases_hash[:b2].value} | #{board.cases_hash[:b3].value} |"
    puts "-" * 13
    puts "| #{board.cases_hash[:c1].value} | #{board.cases_hash[:c2].value} | #{board.cases_hash[:c3].value} |"
    puts "-" * 13
  end

  def show_game(game)
    #TO DO : affiche sur le terminal l'objet de classe Game en entrée. S'active avec un Show.new.show_game(instance_de_Game)
    system('clear')
    puts "MORPION".colorize(:green)
    puts "Joueur 1 : #{game.player_1.name}".colorize(:blue)
    puts "Score    : #{game.player_1.score}".colorize(:blue)
    puts "Joueur 2 : #{game.player_2.name}".colorize(:red)
    puts "Score    : #{game.player_2.score}".colorize(:red)
  end

end