class StickArt
  attr_accessor :art
  private :art, :art=

  def initialize
    self.art = read_art_file
  end

  def draw(step)
    starting_line = 10 * (step - 1);
    ending_line = 10 * step - 1;
    art[starting_line..ending_line]
  end

  private

  def read_art_file
    File.read("stick_art.txt").split("\n")
  end

end
