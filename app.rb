require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/player.rb'
require 'app/game.rb'
require 'app/board.rb'
require 'app/board_case.rb'
require 'views/application.rb'
require 'views/show.rb'

Application.new.perform