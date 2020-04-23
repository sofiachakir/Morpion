
class Game
  attr_accessor :player_1, :player_2, :board, :available_board_cases_hash

  def initialize(player_1_name, player_2_name)
    @player_1 = Player.new(player_1_name)
    @player_2 = Player.new(player_2_name)
    @board = Board.new
    puts "que le jeu commence ! #{@player_1.name} tu commences !"
    @player_1.turn = true
    @available_board_cases_hash = @board.cases_hash.clone
  end

  def play_turn
    # Vérifie à qui est le tour
    if @player_1.turn
      puts "#{@player_1.name} c'est ton tour !"
    else
      puts "#{@player_2.name} c'est ton tour !"
    end
  end

  def show_help
    puts 'Choisis une case !'
    puts '-----------------'
    puts '| A1 | A2 | A3 |'
    puts '-----------------'
    puts '| B1 | B2 | B3 |'
    puts '-----------------'
    puts '| C1 | C2 | C3 |'
    puts '-----------------'
  end

  def menu
    # Affiche les cases disponibles
    puts "Tapes 'H' si tu veux voir à quoi correspondent les noms des cases"
    i = 0
    @available_board_cases_hash.each do |key, value|
      puts "#{i}. #{key}"
      i += 1
    end
    print '> '
  end

  def menu_choice(user_choice)
    if user_choice.match(/[0-9]/) && user_choice.to_i >= 0 && user_choice.to_i < @available_board_cases_hash.size
      update_board(user_choice)
    elsif user_choice == 'H'
      show_help
      change_turns
    else
      puts "ERREUR !!!!! Choisis un des chiffres proposés s'il te plait."
      change_turns
    end
  end

  def update_board(user_choice)
    if @player_1.turn
      @board.cases_hash[@available_board_cases_hash.keys[user_choice.to_i]].cross
    else
       @board.cases_hash[@available_board_cases_hash.keys[user_choice.to_i]].ring
    end
    @available_board_cases_hash.delete(@available_board_cases_hash.keys[user_choice.to_i])
    @board.show_board
  end

  def change_turns
    # On passe le tour à l'autre joueur
    @player_1.turn = !@player_1.turn
    @player_2.turn = !@player_2.turn
  end

  def is_still_going?
    # Si le plateau n'est pas rempli et que personne n'a aligné un symbole 3 fois
    if winner == nil && @available_board_cases_hash.size > 0
      true
    else
      false
    end
  end

  def my_game_end
    if winner == nil
      puts 'Partie nulle'
    elsif winner == 'X'.colorize(:blue)
      puts "#{@player_1.name} a gagné !"
    else
      puts "#{@player_2.name} a gagné !"
    end
  end

  def winner
    # Définir les combinaisons gagnantes
    [
      [:a1,:a2,:a3],[:b1,:b2,:b3],[:c1,:c2,:c3],  # lignes
      [:a1,:b1,:c1],[:a2,:b2,:c2],[:a3,:b3,:c3],  # colonnes
      [:c1,:b2,:a3],[:a1,:b2,:c3]           # diagonal
    ].each do |pattern| # pattern = combinaison gagnante
      players = pattern.map{|i| @board.cases_hash[i].value }.uniq # uniq (pour supprimer les doublons)
      next if players.size != 1 # si taille = 1, c'étaient des doublons, et c'est gagné !
      winner = players.first
      next if winner == ' '
      return winner
    end
    nil
  end

end