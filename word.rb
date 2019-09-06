class Word
  attr_accessor :word_list
  private :word_list, :word_list=

  def initialize
    self.word_list = read_words_file
  end

  def get_word(word_id=nil) 
    word_id = rand(word_list.size) unless word_id #provided
    { word_id: word_id, word: word_list[word_id] }
  end

  private

  def read_words_file
    File.read("words.txt").split("\n")
  end

end
