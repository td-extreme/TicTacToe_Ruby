#!/usr/bin/ruby
require_relative '../lib/ttt.rb'

puts "Welcome"
myGame = TicTacToe.new
myGame.game_loop
