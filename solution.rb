# Please copy/paste all three classes into this file to submit your solution!
class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.detect { |movie| movie.title == title}
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self}
  end

  def viewers
    self.ratings.map { |rating| rating.viewer}
  end

  def average_rating
    sum = 0
    count = 0
    self.ratings.each do |rating|
      count += 1
      sum += rating.score
    end
    sum/count.to_f
  end
end


#=========================================================

class Viewer
  attr_accessor :first_name, :last_name
  @@all = []
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.detect { |viewer| viewer.full_name == name}
  end

  def create_rating(movie, score)
    Rating.new(self, movie, score)
  end

end



#=========================================================

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
