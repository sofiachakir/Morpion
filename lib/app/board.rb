require 'pry'
class Board
  attr_accessor :cases_hash

  def initialize
    @cases_hash = {
      a1: BoardCase.new, a2: BoardCase.new, a3: BoardCase.new,
      b1: BoardCase.new, b2: BoardCase.new, b3: BoardCase.new,
      c1: BoardCase.new, c2: BoardCase.new, c3: BoardCase.new
    }
  end

  def update_board(case_to_update, case_value)
    @cases_hash[case_to_update].value = case_value
  end

  def winner
    # Définir les combinaisons gagnantes
    [
      [:a1,:a2,:a3],[:b1,:b2,:b3],[:c1,:c2,:c3],  # lignes
      [:a1,:b1,:c1],[:a2,:b2,:c2],[:a3,:b3,:c3],  # colonnes
      [:c1,:b2,:a3],[:a1,:b2,:c3]           # diagonal
    ].each do |pattern| # pattern = combinaison gagnante
      players = pattern.map{|i| @cases_hash[i].value }.uniq # uniq (pour supprimer les doublons)
      if players.size != 1 # si taille = 1, c'étaient des doublons, et c'est gagné !
        next
      else
        winner = players.first
        if winner == ' '
          next
        else
          return winner
        end
      end
    end
    nil
  end

end
