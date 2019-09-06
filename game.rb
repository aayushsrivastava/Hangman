require "./word"
require "./stick_art"

class Game
  attr_accessor :trials, :secret_word, :guesses, :word_list, :stick_art
  private :trials, :trials=
  private :secret_word, :secret_word=
  private :guesses, :guesses=
  private :word_list, :word_list=
  private :stick_art, :stick_art=

  public

  def initialize
    self.word_list = Word.new
    self.stick_art = StickArt.new
  end

  def load(states=nil)
    if states #provided
      self.secret_word = word_list.get_word(states[:word_id])
      self.guesses = states[:guesses]
      self.trials = calculate_trials
    else
      new
    end
  end

  def state
    { word_id: secret_word[:word_id], guesses: guesses }
  end

  def play(input)
    guess = input.upcase
    unless guesses.include?(guess) || over? || !valid(input)
      self.trials = trials + 1 unless (secret_word[:word].include?(guess))
      guesses.push(guess)
    end
  end

  def show
    output = stick_art.draw(trials)
      .push("")
      .push("Word    : " + hidden_word)
      .push("Trial   : " + trials.to_s + " of 6")
      .push("Guesses : " + guesses.to_s)
    if lost?
      output.push("YOU LOSE!") 
        .push("The secret word was: " + secret_word[:word])
    elsif won?
      output.push("YOU WIN!")
        .push(" ")
    else
      output.push("")
        .push(" ")
    end
  end

  def over?
    won? || lost?
  end

  private

  def new
    self.secret_word = word_list.get_word
    self.guesses = []
    self.trials = 1
  end

  def lost?
    trials == 6
  end

  def won?
    !hidden_word.include?("-") 
  end

  def calculate_trials
    word = secret_word[:word]
    trials = 1
    guesses.each { |guess| trials += 1 unless word.include?(guess) }
    trials
  end

  def hidden_word
    secret_word[:word].split("").map do |letter|
      if guesses.include?(letter)
        letter
      else
        "-"
      end
    end .join
  end

  def valid(input)
    return false if input.size != 1
    input =~ /[[:alpha:]]/
  end

end
