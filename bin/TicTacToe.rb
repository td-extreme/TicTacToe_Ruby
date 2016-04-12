#!/usr/bin/ruby
lib = File.expand_path("../../lib", __FILE__)
$:.unshift(lib)

require 'ttt'
puts "Welcome"
myGame = TicTacToe.new
myGame.game_loop
