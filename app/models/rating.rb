class Rating
  attr_reader :viewer, :movie
  attr_accessor :score
  @@all = []

  def self.all
    @@all
  end

  def initialize(viewer, movie, score)
    @viewer = viewer
    @movie = movie
    @score = score
    @@all << self
  end

  
end
