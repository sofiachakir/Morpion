
class Game
  attr_accessor :player_1, :player_2, :board, :available_board_cases_hash, :round

  def initialize(player_1_name, player_2_name)
    @player_1 = Player.new(player_1_name)
    @player_2 = Player.new(player_2_name)
    @player_2.symbol = 'O'.colorize(:red)
    @board = Board.new
    @player_1.turn = true
    @available_board_cases_hash = @board.cases_hash.clone
    @round = 1
  end

  def play_turn
    # Vérifie à qui est le tour
    puts "-" * 50
    if @player_1.turn
      puts "#{@player_1.name} c'est ton tour !"
    else
      puts "#{@player_2.name} c'est ton tour !"
    end
  end

  def show_help
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
    puts "-" * 50
    puts "Tapes 'H' si tu veux voir à quoi correspondent les noms des cases"
    puts 'Sinon, choisis une case !'
    i = 0
    @available_board_cases_hash.each do |key, value|
      puts "#{i}. #{key}"
      i += 1
    end
    print '> '
  end

  def menu_choice(user_choice)
    if user_choice.match(/^[0-9]$/) && user_choice.to_i >= 0 && user_choice.to_i < @available_board_cases_hash.size
      case_to_update = @available_board_cases_hash.keys[user_choice.to_i]
      @player_1.turn ? case_value = @player_1.symbol : case_value = @player_2.symbol
      @board.update_board(case_to_update, case_value)
      @available_board_cases_hash.delete(case_to_update)
    elsif user_choice == 'H'
      show_help
      change_turns
      puts "Appuie sur une touche pour continuer"
      gets.chomp
    else
      puts "ERREUR !!!!! Choisis un des chiffres proposés s'il te plait."
      change_turns
      puts "Appuie sur une touche pour continuer"
      gets.chomp
    end
  end

  def change_turns
    # On passe le tour à l'autre joueur
    @player_1.turn = !@player_1.turn
    @player_2.turn = !@player_2.turn
  end

  def is_still_going?
    # Si le plateau n'est pas rempli et que personne n'a aligné un symbole 3 fois
    @board.winner == nil && @available_board_cases_hash.size > 0 ? true : false
  end

  def my_game_end
    puts "-" * 50
    if @available_board_cases_hash.size == 0
      puts 'Partie nulle'
    elsif @board.winner == 'X'.colorize(:blue)
      @player_1.score += 1
      puts "#{@player_1.name} a gagné !"
    else
      puts "#{@player_2.name} a gagné !"
      @player_2.score += 1
    end
    puts "-" * 50
  end

  def new_round
    user_choice = "0"
    while !user_choice.match(/^[YN]$/)
      puts "Voulez-vous rejouer ? (Y/N)"
      user_choice = gets.chomp
    end
    if user_choice == "Y"
      @board = Board.new
      @available_board_cases_hash = @board.cases_hash.clone
      @round += 1
      true
    else
      "Merci à bientôt !"
      false
    end
  end

end