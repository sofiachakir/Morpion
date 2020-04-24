class Application

	def perform
		# Initialisation du jeu
		puts 'Bienvenue dans le meilleur jeu de Morpion du MONDE !'
		puts 'Joueur 1, quel est ton prénom ?'
		print '> '
		player_1_name = gets.chomp
		puts 'Joueur 2, quel est ton prénom ?'
		print '> '
		player_2_name = gets.chomp
		my_game = Game.new(player_1_name, player_2_name)

		play_again = true
		while play_again
			while my_game.is_still_going?
				Show.new.show_game(my_game)
				Show.new.show_board(my_game.board)
			  my_game.play_turn
			  my_game.menu
			  user_choice = gets.chomp
			  my_game.menu_choice(user_choice)
			  my_game.change_turns
			end
			Show.new.show_game(my_game)
			Show.new.show_board(my_game.board)
			my_game.my_game_end
			play_again = my_game.new_round
		end
	end
end