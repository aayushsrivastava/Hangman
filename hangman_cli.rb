require "./game"

game = Game.new
game.load

loop do
  system("clear") || system("cls")
  puts game.show
  break if game.over?
  print "Enter a letter: "
  guess = gets.chomp
  game.play(guess)
end
